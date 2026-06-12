# backup_to_drive.ps1
# 將所有重要設定檔備份到 Google Drive
# 在舊電腦執行，新電腦透過 setup_new_pc.ps1 自動還原

$userProfile = $env:USERPROFILE
$projectPath = "$userProfile\Downloads\Sean windows agent"
$driveTarget = "gdrive:Sean-windows-agent/pc-backup"

# 找 rclone 執行路徑
$rcloneExe = Get-ChildItem "$userProfile\AppData\Local\Microsoft\WinGet\Packages\Rclone.Rclone*" `
    -Recurse -Filter "rclone.exe" -ErrorAction SilentlyContinue |
    Select-Object -First 1 -ExpandProperty FullName

if (-not $rcloneExe) {
    $cmd = Get-Command rclone -ErrorAction SilentlyContinue
    if ($cmd) { $rcloneExe = $cmd.Source }
}

if (-not $rcloneExe) {
    Write-Host "找不到 rclone，請先安裝：winget install Rclone.Rclone" -ForegroundColor Red
    exit 1
}

function OK   { param($msg) Write-Host "  OK  $msg" -ForegroundColor Green }
function INFO { param($msg) Write-Host "      $msg" -ForegroundColor Gray }
function WARN { param($msg) Write-Host "  !!  $msg" -ForegroundColor Red }

Write-Host ""
Write-Host "======================================" -ForegroundColor Magenta
Write-Host "  備份重要設定到 Google Drive" -ForegroundColor Magenta
Write-Host "  目的地：$driveTarget" -ForegroundColor Magenta
Write-Host "======================================" -ForegroundColor Magenta
Write-Host ""

# 建立暫存備份資料夾（明確使用 LOCALAPPDATA 避免 TEMP 為空）
$staging = "$userProfile\AppData\Local\Temp\sean-pc-backup"
$null = New-Item -ItemType Directory -Path $staging -Force

# 定義要備份的檔案（來源 → 暫存子路徑）
$backupItems = @(
    @{ src = "$userProfile\.libtv\libtv.exe";          dst = "libtv\libtv.exe" },
    @{ src = "$userProfile\.libtv\credentials.json";   dst = "libtv\credentials.json" },
    @{ src = "$userProfile\AppData\Roaming\rclone\rclone.conf"; dst = "rclone\rclone.conf" },
    @{ src = "$userProfile\.claude\commands\model.md"; dst = "claude-commands\model.md" }
)

# 備份記憶檔（memory 資料夾全部）
$memoryDir = "$userProfile\.claude\projects\C--Users-User-Downloads-Sean-windows-agent\memory"
if (Test-Path $memoryDir) {
    Get-ChildItem $memoryDir -Filter "*.md" | ForEach-Object {
        $backupItems += @{ src = $_.FullName; dst = "claude-memory\$($_.Name)" }
    }
}

# 複製到暫存區
Write-Host "[1/2] 整理備份檔案..." -ForegroundColor Cyan
foreach ($item in $backupItems) {
    if (Test-Path $item.src) {
        $destPath = "$staging\$($item.dst)"
        $destDir  = Split-Path $destPath
        $null = New-Item -ItemType Directory -Path $destDir -Force
        Copy-Item $item.src $destPath -Force
        OK $item.dst
    } else {
        WARN "找不到：$($item.src)（跳過）"
    }
}

# 上傳到 Google Drive
Write-Host ""
Write-Host "[2/2] 上傳到 Google Drive..." -ForegroundColor Cyan

& $rcloneExe copy $staging $driveTarget `
    --transfers 4 `
    --progress `
    --log-level INFO

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "======================================" -ForegroundColor Magenta
    Write-Host "  備份完成！" -ForegroundColor Green
    Write-Host "  Google Drive 路徑：$driveTarget" -ForegroundColor Gray
    Write-Host ""
    Write-Host "  新電腦執行 setup_new_pc.ps1 可自動還原" -ForegroundColor Gray
    Write-Host "======================================" -ForegroundColor Magenta
} else {
    WARN "上傳失敗，請確認 rclone gdrive 遠端已設定"
    INFO "執行 rclone config 新增 gdrive 遠端後重試"
}

# 清理暫存
if ($staging) { Remove-Item $staging -Recurse -Force -ErrorAction SilentlyContinue }
