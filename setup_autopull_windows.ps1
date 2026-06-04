$REPO_URL = "https://github.com/sean860619/kinpo-trend-report.git"
$REPO_DIR = "$env:USERPROFILE\Documents\sean-agent"

# 若尚未 clone 就先 clone
if (-not (Test-Path $REPO_DIR)) {
    git clone $REPO_URL $REPO_DIR
}

# 建立 auto_pull.ps1
$pullScript = @"
Set-Location "$REPO_DIR"
git pull origin master
"@
$pullScript | Out-File "$REPO_DIR\auto_pull.ps1" -Encoding UTF8

# 建立排程：每天 12:00 自動 pull
$action = New-ScheduledTaskAction `
    -Execute "powershell.exe" `
    -Argument "-NonInteractive -WindowStyle Hidden -File `"$REPO_DIR\auto_pull.ps1`""

$trigger = New-ScheduledTaskTrigger -Daily -At "12:00"

$settings = New-ScheduledTaskSettingsSet `
    -ExecutionTimeLimit (New-TimeSpan -Minutes 5) `
    -StartWhenAvailable `
    -RunOnlyIfNetworkAvailable

Register-ScheduledTask `
    -TaskName "GitAutoPull-SeanAgent" `
    -Action $action `
    -Trigger $trigger `
    -Settings $settings `
    -Description "Daily 12:00: git pull from GitHub" `
    -Force

Write-Host "Done! Repo: $REPO_DIR"
Write-Host "Auto pull scheduled daily at 12:00"
