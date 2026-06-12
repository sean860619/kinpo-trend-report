# setup_new_pc.ps1
# 新電腦一鍵設定腳本（Sean 專用）
# 執行方式：以系統管理員身分開啟 PowerShell，執行此腳本
# 特性：已安裝項目自動跳過，不覆蓋現有設定

$ErrorActionPreference = "Continue"

# 路徑變數（自動抓新電腦的使用者名稱）
$userProfile  = $env:USERPROFILE
$username     = $env:USERNAME
$projectPath  = "$userProfile\Downloads\Sean windows agent"
$claudePath   = "$userProfile\.claude"
$libtvPath    = "$userProfile\.libtv"
$profilePath  = "$userProfile\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"
$wmuxPath     = "$userProfile\Downloads\wmux-0.8.0-win-x64"
$repoUrl      = "https://github.com/sean860619/kinpo-trend-report.git"
$totalSteps   = 12

# 顯示格式化訊息
function Step  { param($n, $msg) Write-Host "`n[$n/$totalSteps] $msg" -ForegroundColor Cyan }
function OK    { param($msg)     Write-Host "  OK  $msg" -ForegroundColor Green }
function SKIP  { param($msg)     Write-Host "  --  已存在，跳過：$msg" -ForegroundColor Yellow }
function WARN  { param($msg)     Write-Host "  !!  $msg" -ForegroundColor Red }
function INFO  { param($msg)     Write-Host "      $msg" -ForegroundColor Gray }

Write-Host ""
Write-Host "============================================" -ForegroundColor Magenta
Write-Host "  Sean 新電腦 Claude Code + wmux 環境設定  " -ForegroundColor Magenta
Write-Host "============================================" -ForegroundColor Magenta
Write-Host "  使用者：$username" -ForegroundColor Gray
Write-Host "  專案路徑：$projectPath" -ForegroundColor Gray
Write-Host ""

# =============================================================
# Step 1：安裝基礎軟體（winget）
# =============================================================
Step 1 "安裝基礎軟體（VS Code / Node.js / Git / yt-dlp / rclone）"

$packages = @(
    @{ id = "Microsoft.VisualStudioCode"; name = "VS Code" },
    @{ id = "OpenJS.NodeJS.LTS";          name = "Node.js LTS" },
    @{ id = "Git.Git";                    name = "Git" },
    @{ id = "yt-dlp.yt-dlp";             name = "yt-dlp" },
    @{ id = "Rclone.Rclone";             name = "rclone（Google Drive 同步）" }
)

foreach ($pkg in $packages) {
    $installed = winget list --id $pkg.id --exact -q 2>$null
    if ($LASTEXITCODE -eq 0 -and $installed -match $pkg.id) {
        SKIP $pkg.name
    } else {
        INFO "正在安裝 $($pkg.name)..."
        winget install --id $pkg.id --exact --silent --accept-package-agreements --accept-source-agreements
        OK "$($pkg.name) 安裝完成"
    }
}

# =============================================================
# Step 2：安裝 Claude Code CLI
# =============================================================
Step 2 "安裝 Claude Code CLI"

$claudeVer = & claude --version 2>$null
if ($claudeVer) {
    SKIP "Claude Code 已安裝：$claudeVer"
} else {
    INFO "正在安裝 Claude Code..."
    npm install -g @anthropic-ai/claude-code
    OK "Claude Code CLI 安裝完成"
}

# =============================================================
# Step 3：wmux 確認
# =============================================================
Step 3 "wmux 安裝確認"

if (Test-Path "$wmuxPath\wmux.exe") {
    OK "wmux 已存在：$wmuxPath"
} else {
    WARN "wmux 尚未安裝！"
    INFO "請手動下載：https://wmux.dev（Windows 版）"
    INFO "解壓至：$wmuxPath"
    INFO "（腳本繼續執行，wmux 可之後補裝）"
}

# =============================================================
# Step 4：建立專案資料夾結構
# =============================================================
Step 4 "建立專案資料夾結構（Sean windows agent）"

# 所有需要的子資料夾
$projectDirs = @(
    $projectPath,
    "$projectPath\assets",
    "$projectPath\data",
    "$projectPath\references",
    "$projectPath\reports",
    "$projectPath\scripts",
    "$projectPath\scripts\system",
    "$projectPath\scripts\void_mv",
    "$projectPath\VOID_clips",
    "$projectPath\.libtv-skill",
    "$projectPath\.claude",
    "$projectPath\.claude\commands"
)

foreach ($d in $projectDirs) {
    if (-not (Test-Path $d)) {
        New-Item -ItemType Directory -Path $d -Force | Out-Null
        OK "建立：$d"
    } else {
        SKIP $d
    }
}

# =============================================================
# Step 5：Clone 或更新 GitHub 專案（含所有 MD 與 PS1 檔）
# =============================================================
Step 5 "同步 GitHub 專案（所有 .md / .ps1 檔案）"

if (Test-Path "$projectPath\.git") {
    SKIP "專案已存在，執行 git pull 更新..."
    git -C $projectPath pull
    OK "git pull 完成"
} else {
    INFO "正在 Clone 專案..."
    git clone $repoUrl $projectPath
    OK "Clone 完成：$projectPath"
}

# =============================================================
# Step 6：建立 .claude 目錄結構
# =============================================================
Step 6 "建立 ~/.claude 目錄結構"

$claudeDirs = @(
    $claudePath,
    "$claudePath\commands",
    "$claudePath\projects"
)
foreach ($d in $claudeDirs) {
    if (-not (Test-Path $d)) {
        New-Item -ItemType Directory -Path $d -Force | Out-Null
        OK "建立：$d"
    } else {
        SKIP $d
    }
}

# =============================================================
# Step 7：建立 ~/.claude/settings.json（24 條黑名單）
# =============================================================
Step 7 "設定 ~/.claude/settings.json（安全黑名單 + 權限）"

$settingsPath = "$claudePath\settings.json"
if (Test-Path $settingsPath) {
    SKIP "settings.json 已存在（備份為 .bak 後跳過）"
    Copy-Item $settingsPath "${settingsPath}.bak" -Force
} else {
    $wmuxHook = "$wmuxPath\resources\cli\wmux-hook.js" -replace "\\", "/"

    $settings = @"
{
  "permissions": {
    "deny": [
      "Bash(rm -rf*)",
      "Bash(rm -Rf*)",
      "Bash(rm -r /*)",
      "Bash(Remove-Item -Recurse -Force C:\\\\*)",
      "Bash(Remove-Item -Recurse -Force /*)",
      "Bash(sudo *)",
      "Bash(dd *)",
      "Bash(mkfs*)",
      "Bash(diskutil eraseDisk*)",
      "Bash(format *)",
      "Bash(diskpart*)",
      "Bash(chmod 777*)",
      "Bash(icacls * /grant Everyone:F*)",
      "Bash(git reset --hard*)",
      "Bash(git push --force*)",
      "Bash(git push -f *)",
      "Bash(git clean -f*)",
      "Bash(git branch -D *)",
      "Bash(shutdown*)",
      "Bash(reboot*)",
      "Bash(Restart-Computer*)",
      "Bash(Stop-Computer*)",
      "Bash(truncate *)",
      "Bash(: >*)"
    ],
    "defaultMode": "bypassPermissions"
  },
  "hooks": {
    "Stop": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "`$f='SESSION_LOG.md'; if(Test-Path `$f){`$d=Get-Date -Format 'yyyy-MM-dd HH:mm'; `$c=Get-Content `$f -Raw -Encoding UTF8; if(`$c -match 'last active'){Set-Content `$f (`$c -replace 'last active: [\\d\\-: ]+', \"last active: `$d\") -Encoding UTF8}else{Add-Content `$f \"`nlast active: `$d\" -Encoding UTF8}} 2>`$null; exit 0",
            "shell": "powershell",
            "async": true
          }
        ]
      }
    ],
    "PostToolUse": [
      {
        "matcher": "Bash",
        "hooks": [{ "type": "command", "command": "node \"$wmuxHook\" Bash 2>/dev/null || true" }]
      },
      {
        "matcher": "Read",
        "hooks": [{ "type": "command", "command": "node \"$wmuxHook\" Read 2>/dev/null || true" }]
      },
      {
        "matcher": "Write",
        "hooks": [{ "type": "command", "command": "node \"$wmuxHook\" Write 2>/dev/null || true" }]
      },
      {
        "matcher": "Edit",
        "hooks": [{ "type": "command", "command": "node \"$wmuxHook\" Edit 2>/dev/null || true" }]
      },
      {
        "matcher": "Grep",
        "hooks": [{ "type": "command", "command": "node \"$wmuxHook\" Grep 2>/dev/null || true" }]
      },
      {
        "matcher": "Glob",
        "hooks": [{ "type": "command", "command": "node \"$wmuxHook\" Glob 2>/dev/null || true" }]
      },
      {
        "matcher": "Agent",
        "hooks": [{ "type": "command", "command": "node \"$wmuxHook\" Agent 2>/dev/null || true" }]
      },
      {
        "matcher": "Skill",
        "hooks": [{ "type": "command", "command": "node \"$wmuxHook\" Skill 2>/dev/null || true" }]
      }
    ]
  },
  "enabledPlugins": {
    "wmux-orchestrator@wmux": true
  },
  "autoUpdatesChannel": "latest",
  "theme": "dark",
  "mcpServers": {
    "filesystem": {
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-filesystem",
        "$userProfile\\Desktop",
        "$userProfile\\Documents",
        "$userProfile\\Downloads"
      ]
    }
  },
  "skipDangerousModePermissionPrompt": true
}
"@
    Set-Content -Path $settingsPath -Value $settings -Encoding UTF8
    OK "settings.json 建立完成（24 條黑名單）"
}

# =============================================================
# Step 8：建立 ~/.claude/CLAUDE.md
# =============================================================
Step 8 "設定 ~/.claude/CLAUDE.md（全域規則）"

$globalClaude = "$claudePath\CLAUDE.md"
if (Test-Path $globalClaude) {
    SKIP "~/.claude/CLAUDE.md 已存在（不覆蓋）"
} else {
    $claudeMdContent = @'
<!-- wmux:start — AUTO-MANAGED BY wmux. Do not edit this section manually. -->

# wmux

You are running inside wmux, a terminal multiplexer with a browser panel on the right side that the user can see in real-time.

## Browser

For any web browsing task, use the `wmux browser` commands so the user can watch in the browser panel. Do NOT use Playwright, Firecrawl, or WebSearch.

```bash
wmux browser open <url>
wmux browser snapshot
wmux browser click @eN
wmux browser type @eN <text>
wmux browser fill @eN <value>
wmux browser get-text
wmux browser screenshot
wmux browser eval <js>
wmux browser back / forward / reload
```

<!-- wmux:end -->

## 操作前通知
- 修改檔案前，先列出你要動哪些檔案，等我確認再動
- 一次只做一件事，做完再問我下一步
- 不要自動安裝套件，先告訴我套件名稱和用途再安裝

## 輸出格式
- 程式碼一定要加中文註解
- 給我終端機指令時，一行一行給，不要一次全部貼
- 回覆用條列，不要長篇大論

## 安全規則
- 禁止刪除任何檔案，除非我明確說「刪除」
- .env / .env.local 檔案不能動
- 禁止 git push --force

## Context 管理
- context 超過 80% 時，回覆末尾加上 /compact 提醒
- 新 session 自動掃描所有 .md 檔，優先讀 SESSION_LOG.md / CLAUDE.md
'@
    Set-Content -Path $globalClaude -Value $claudeMdContent -Encoding UTF8
    OK "~/.claude/CLAUDE.md 建立完成"
}

# =============================================================
# Step 9：設定 PowerShell Profile（安全合併）
# =============================================================
Step 9 "設定 PowerShell Profile（rr / cc / claude-status）"

$profileDir = Split-Path $profilePath
if (-not (Test-Path $profileDir)) {
    New-Item -ItemType Directory -Path $profileDir -Force | Out-Null
}

$profileBlock = @"

# === Sean Claude Code 設定（由 setup_new_pc.ps1 寫入）===
function cc { Set-Location '$projectPath'; `$env:CLAUDE_CODE_NO_FLICKER = '1'; claude @args }

`$env:PATH += ';$userProfile\.local\bin'
`$env:PATH += ';$libtvPath'

function Remove-ToRecycleBin {
    param([Parameter(ValueFromRemainingArguments=`$true)][string[]]`$Path)
    `$shell = New-Object -ComObject Shell.Application
    foreach (`$p in `$Path) {
        `$item = Get-Item -LiteralPath `$p -ErrorAction Stop
        `$shell.Namespace(0).ParseName(`$item.FullName).InvokeVerb('delete')
    }
}
Set-Alias -Name rm  -Value Remove-ToRecycleBin -Force -Option AllScope
Set-Alias -Name rr  -Value Remove-ToRecycleBin -Force -Option AllScope

function Remove-Force { Remove-Item -Force -Recurse @args }
Set-Alias -Name rmf -Value Remove-Force -Force -Option AllScope

function claude-status {
    `$settingsPath = "`$env:USERPROFILE\.claude\settings.json"
    Write-Host "=== Claude Code Status ===" -ForegroundColor Cyan
    Write-Host "Version: `$(claude --version 2>`$null)" -ForegroundColor White
    if (Test-Path `$settingsPath) {
        `$s = Get-Content `$settingsPath -Raw | ConvertFrom-Json
        Write-Host "Permission mode: `$(`$s.permissions.defaultMode)" -ForegroundColor Green
        Write-Host "Deny rules: `$(`$s.permissions.deny.Count)" -ForegroundColor Green
    }
    if (Get-Alias rr -ErrorAction SilentlyContinue) {
        Write-Host "Safe delete (rr): OK" -ForegroundColor Green
    } else {
        Write-Host "Safe delete (rr): NOT SET" -ForegroundColor Red
    }
}
# === Sean Claude Code 設定結束 ===
"@

if (Test-Path $profilePath) {
    $existing = Get-Content $profilePath -Raw -Encoding UTF8
    if ($existing -match "Sean Claude Code 設定") {
        SKIP "PowerShell Profile 已包含設定"
    } else {
        Add-Content -Path $profilePath -Value $profileBlock -Encoding UTF8
        OK "PowerShell Profile 合併完成（保留原有設定）"
    }
} else {
    Set-Content -Path $profilePath -Value $profileBlock -Encoding UTF8
    OK "PowerShell Profile 建立完成"
}

# =============================================================
# Step 10：更新腳本路徑 + 設定自動備份排程
# =============================================================
Step 10 "設定雲端自動備份排程（GitHub + Google Drive）"

# 找 rclone 執行路徑（winget 安裝位置）
$rcloneExe = Get-ChildItem "$userProfile\AppData\Local\Microsoft\WinGet\Packages\Rclone.Rclone*" `
    -Recurse -Filter "rclone.exe" -ErrorAction SilentlyContinue | Select-Object -First 1 -ExpandProperty FullName

if (-not $rcloneExe) {
    # 嘗試 PATH
    $rcloneExe = (Get-Command rclone -ErrorAction SilentlyContinue)?.Source
}

# 更新 auto_commit.ps1 路徑
$autoCommitPath = "$projectPath\scripts\system\auto_commit.ps1"
if (Test-Path $autoCommitPath) {
    $content = Get-Content $autoCommitPath -Raw -Encoding UTF8
    $updated = $content -replace 'C:\\Users\\[^\\]+\\Downloads\\Sean windows agent', $projectPath
    if ($updated -ne $content) {
        Set-Content -Path $autoCommitPath -Value $updated -Encoding UTF8
        OK "auto_commit.ps1 路徑更新為：$projectPath"
    } else {
        SKIP "auto_commit.ps1 路徑已是最新"
    }
}

# 更新 sync_to_drive.ps1 路徑
$syncPath = "$projectPath\scripts\system\sync_to_drive.ps1"
if (Test-Path $syncPath) {
    $content = Get-Content $syncPath -Raw -Encoding UTF8
    # 更新 SOURCE 路徑
    $updated = $content -replace 'C:\\Users\\[^\\]+\\Downloads\\Sean windows agent', $projectPath
    # 更新 rclone 路徑（如果找到）
    if ($rcloneExe) {
        $updated = $updated -replace '\$RCLONE\s*=\s*"[^"]+"', "`$RCLONE = `"$rcloneExe`""
        OK "rclone 路徑更新為：$rcloneExe"
    } else {
        WARN "找不到 rclone 路徑，請安裝後手動更新 sync_to_drive.ps1"
    }
    if ($updated -ne $content) {
        Set-Content -Path $syncPath -Value $updated -Encoding UTF8
        OK "sync_to_drive.ps1 路徑更新完成"
    } else {
        SKIP "sync_to_drive.ps1 路徑已是最新"
    }
}

# 建立 Windows 排程工作（每天 12:00，錯過時補跑）
$tasks = @(
    @{
        name   = "GitAutoCommit-SeanAgent"
        script = $autoCommitPath
        desc   = "每天 12:00 自動 git commit + push 到 GitHub"
    },
    @{
        name   = "SyncToDrive-SeanAgent"
        script = $syncPath
        desc   = "每天 12:00 同步 .md/.ps1 到 Google Drive"
    }
)

foreach ($task in $tasks) {
    if (-not (Test-Path $task.script)) {
        WARN "腳本不存在，跳過排程：$($task.script)"
        continue
    }

    $existing = Get-ScheduledTask -TaskName $task.name -ErrorAction SilentlyContinue
    if ($existing) {
        SKIP "排程已存在：$($task.name)"
    } else {
        $action  = New-ScheduledTaskAction -Execute "powershell.exe" `
                       -Argument "-NonInteractive -WindowStyle Hidden -File `"$($task.script)`""
        # 每天 12:00，錯過時立即補跑
        $trigger = New-ScheduledTaskTrigger -Daily -At "12:00"
        $settings = New-ScheduledTaskSettingsSet `
                       -StartWhenAvailable `
                       -RunOnlyIfNetworkAvailable `
                       -ExecutionTimeLimit (New-TimeSpan -Minutes 10)
        $principal = New-ScheduledTaskPrincipal -UserId $username -LogonType Interactive

        Register-ScheduledTask `
            -TaskName $task.name `
            -Action $action `
            -Trigger $trigger `
            -Settings $settings `
            -Principal $principal `
            -Description $task.desc `
            -Force | Out-Null

        OK "排程建立：$($task.name)（每天 12:00 + 補跑）"
    }
}

# =============================================================
# Step 11：LibTV CLI + rclone gdrive 設定
# =============================================================
Step 11 "LibTV 目錄 + rclone gdrive 設定提示"

if (Test-Path "$libtvPath\libtv.exe") {
    SKIP "LibTV CLI 已安裝"
} else {
    if (-not (Test-Path $libtvPath)) {
        New-Item -ItemType Directory -Path $libtvPath -Force | Out-Null
    }
    WARN "LibTV CLI 尚未安裝"
    INFO "請將 libtv.exe 放入：$libtvPath"
}

if ($rcloneExe) {
    $rcloneConfig = & $rcloneExe listremotes 2>$null
    if ($rcloneConfig -match "gdrive") {
        OK "rclone gdrive 遠端已設定"
    } else {
        WARN "rclone gdrive 遠端尚未設定！"
        INFO "請執行以下指令完成 Google Drive 授權："
        INFO "  rclone config"
        INFO "  → 選 n（新增），名稱輸入 gdrive，選 Google Drive，依指示登入"
    }
}

# =============================================================
# Step 12：從 Google Drive 還原備份檔案
# =============================================================
Step 12 "從 Google Drive 還原備份（credentials / memory / slash commands）"

$driveBackup = "gdrive:Sean-windows-agent/pc-backup"

# 找 rclone（此時應該已裝好）
if (-not $rcloneExe) {
    $rcloneExe = Get-ChildItem "$userProfile\AppData\Local\Microsoft\WinGet\Packages\Rclone.Rclone*" `
        -Recurse -Filter "rclone.exe" -ErrorAction SilentlyContinue |
        Select-Object -First 1 -ExpandProperty FullName
}
if (-not $rcloneExe) {
    $rcloneExe = (Get-Command rclone -ErrorAction SilentlyContinue)?.Source
}

# 確認 gdrive 已設定
$gdriveReady = $false
if ($rcloneExe) {
    $remotes = & $rcloneExe listremotes 2>$null
    if ($remotes -match "gdrive") { $gdriveReady = $true }
}

if (-not $gdriveReady) {
    WARN "gdrive 尚未設定，跳過還原"
    INFO "完成 rclone config 後，手動執行以下指令還原："
    INFO "  .\scripts\system\restore_from_drive.ps1"
} else {
    # 下載暫存區
    $restoreStaging = "$env:TEMP\sean-pc-restore"
    $null = New-Item -ItemType Directory -Path $restoreStaging -Force

    INFO "從 Google Drive 下載備份..."
    & $rcloneExe copy $driveBackup $restoreStaging --transfers 4 2>$null

    # 還原 LibTV 執行檔與憑證
    if (Test-Path "$restoreStaging\libtv\libtv.exe") {
        $null = New-Item -ItemType Directory -Path $libtvPath -Force
        Copy-Item "$restoreStaging\libtv\libtv.exe"        "$libtvPath\libtv.exe"        -Force
        Copy-Item "$restoreStaging\libtv\credentials.json" "$libtvPath\credentials.json" -Force -ErrorAction SilentlyContinue
        OK "LibTV 已還原（免重新登入）"
    } else {
        WARN "Google Drive 上找不到 libtv 備份"
    }

    # 還原 Claude memory 記憶檔
    $memoryDest = "$claudePath\projects\C--Users-$username-Downloads-Sean-windows-agent\memory"
    if (Test-Path "$restoreStaging\claude-memory") {
        $null = New-Item -ItemType Directory -Path $memoryDest -Force
        Copy-Item "$restoreStaging\claude-memory\*" $memoryDest -Force
        OK "Claude 記憶檔已還原（$memoryDest）"
    }

    # 還原 slash command
    if (Test-Path "$restoreStaging\claude-commands\model.md") {
        Copy-Item "$restoreStaging\claude-commands\model.md" "$claudePath\commands\model.md" -Force
        OK "Slash command model.md 已還原"
    }

    # 清理暫存
    Remove-Item $restoreStaging -Recurse -Force -ErrorAction SilentlyContinue
    OK "Google Drive 還原完成"
}

# =============================================================
# 完成摘要
# =============================================================
Write-Host ""
Write-Host "============================================" -ForegroundColor Magenta
Write-Host "  設定完成！" -ForegroundColor Magenta
Write-Host "============================================" -ForegroundColor Magenta
Write-Host ""
Write-Host "[ 還需手動完成 ]" -ForegroundColor Yellow
Write-Host "  1. wmux      ：下載 https://wmux.dev 解壓至 $wmuxPath" -ForegroundColor Yellow
Write-Host "  2. rclone    ：若跳過還原，執行 rclone config 設定 gdrive" -ForegroundColor Yellow
Write-Host "  3. claude login：登入 Anthropic 帳號" -ForegroundColor Yellow
Write-Host "  4. 重開 PS   ：重新開啟 PowerShell 讓 profile 生效" -ForegroundColor Yellow
Write-Host ""
Write-Host "[ 驗證指令 ]" -ForegroundColor Cyan
Write-Host "  claude --version   → Claude Code 版本" -ForegroundColor White
Write-Host "  claude-status      → 黑名單 + 權限確認" -ForegroundColor White
Write-Host "  cc                 → 進入專案 + 啟動 Claude" -ForegroundColor White
Write-Host "  libtv --version    → LibTV CLI 確認" -ForegroundColor White
Write-Host "  rclone listremotes → 確認 gdrive 已設定" -ForegroundColor White
Write-Host ""
