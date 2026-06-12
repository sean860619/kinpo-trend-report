# restore_from_drive.ps1
# 從 Google Drive 還原備份到新電腦
# 適合 setup_new_pc.ps1 執行時 gdrive 尚未設定，事後補跑

$userProfile  = $env:USERPROFILE
$username     = $env:USERNAME
$claudePath   = "$userProfile\.claude"
$libtvPath    = "$userProfile\.libtv"
$driveBackup  = "gdrive:Sean-windows-agent/pc-backup"

function OK   { param($msg) Write-Host "  OK  $msg" -ForegroundColor Green }
function WARN { param($msg) Write-Host "  !!  $msg" -ForegroundColor Red }
function INFO { param($msg) Write-Host "      $msg" -ForegroundColor Gray }

Write-Host ""
Write-Host "======================================" -ForegroundColor Magenta
Write-Host "  從 Google Drive 還原設定檔" -ForegroundColor Magenta
Write-Host "======================================" -ForegroundColor Magenta
Write-Host ""

# 找 rclone
$rcloneExe = Get-ChildItem "$userProfile\AppData\Local\Microsoft\WinGet\Packages\Rclone.Rclone*" `
    -Recurse -Filter "rclone.exe" -ErrorAction SilentlyContinue |
    Select-Object -First 1 -ExpandProperty FullName

if (-not $rcloneExe) {
    $rcloneExe = (Get-Command rclone -ErrorAction SilentlyContinue)?.Source
}

if (-not $rcloneExe) {
    WARN "找不到 rclone，請先執行：winget install Rclone.Rclone"
    exit 1
}

# 確認 gdrive 已設定
$remotes = & $rcloneExe listremotes 2>$null
if ($remotes -notmatch "gdrive") {
    WARN "gdrive 遠端尚未設定！"
    INFO "請先執行：rclone config"
    INFO "→ 選 n，名稱輸入 gdrive，類型選 Google Drive，依指示授權"
    exit 1
}

# 下載到暫存區
$staging = "$env:TEMP\sean-pc-restore"
$null = New-Item -ItemType Directory -Path $staging -Force

Write-Host "[1/4] 從 Google Drive 下載備份..." -ForegroundColor Cyan
& $rcloneExe copy $driveBackup $staging --transfers 4 --progress

# 還原 LibTV
Write-Host ""
Write-Host "[2/4] 還原 LibTV..." -ForegroundColor Cyan
if (Test-Path "$staging\libtv\libtv.exe") {
    $null = New-Item -ItemType Directory -Path $libtvPath -Force
    Copy-Item "$staging\libtv\libtv.exe"        "$libtvPath\libtv.exe"        -Force
    OK "libtv.exe 還原完成"

    if (Test-Path "$staging\libtv\credentials.json") {
        Copy-Item "$staging\libtv\credentials.json" "$libtvPath\credentials.json" -Force
        OK "LibTV 憑證還原（免重新登入）"
    }
} else {
    WARN "找不到 libtv 備份，請手動複製 libtv.exe 到 $libtvPath"
}

# 還原 Claude memory
Write-Host ""
Write-Host "[3/4] 還原 Claude 記憶檔..." -ForegroundColor Cyan
$memoryDest = "$claudePath\projects\C--Users-$username-Downloads-Sean-windows-agent\memory"
if (Test-Path "$staging\claude-memory") {
    $null = New-Item -ItemType Directory -Path $memoryDest -Force
    Copy-Item "$staging\claude-memory\*" $memoryDest -Force
    OK "記憶檔還原到：$memoryDest"
    Get-ChildItem $memoryDest | ForEach-Object { INFO $_.Name }
} else {
    WARN "找不到 claude-memory 備份"
}

# 還原 slash command
Write-Host ""
Write-Host "[4/4] 還原 Slash Commands..." -ForegroundColor Cyan
if (Test-Path "$staging\claude-commands\model.md") {
    $null = New-Item -ItemType Directory -Path "$claudePath\commands" -Force
    Copy-Item "$staging\claude-commands\model.md" "$claudePath\commands\model.md" -Force
    OK "model.md 還原完成"
} else {
    WARN "找不到 slash command 備份"
}

# 清理暫存
Remove-Item $staging -Recurse -Force -ErrorAction SilentlyContinue

Write-Host ""
Write-Host "======================================" -ForegroundColor Magenta
Write-Host "  還原完成！" -ForegroundColor Green
Write-Host "======================================" -ForegroundColor Magenta
Write-Host ""
Write-Host "  驗證：libtv --version" -ForegroundColor Gray
Write-Host "  驗證：claude（確認記憶已載入）" -ForegroundColor Gray
Write-Host ""
