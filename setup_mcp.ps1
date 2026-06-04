# MCP 安裝前置：備份設定、安裝 Filesystem 和 Playwright
$npx = "C:\Program Files\nodejs\npx.cmd"
$claude = "claude"

# 備份 .claude.json
$claudeJsonPath = "$env:USERPROFILE\.claude.json"
$backupDir = "$env:USERPROFILE\.claude\mcp-backups"
New-Item -ItemType Directory -Path $backupDir -Force | Out-Null
if (Test-Path $claudeJsonPath) {
    $backupFile = "$backupDir\claude.$(Get-Date -Format 'yyyyMMdd-HHmmss').json"
    Copy-Item $claudeJsonPath $backupFile
    Write-Host "✅ 備份完成：$backupFile"
} else {
    Write-Host "ℹ️  沒有既有 .claude.json，跳過備份"
}

# 安裝 Filesystem MCP（桌面 + Documents + Downloads）
Write-Host "`n📁 安裝 Filesystem MCP..."
& $claude mcp add filesystem -- `
    & $npx -y @modelcontextprotocol/server-filesystem `
    "$env:USERPROFILE\Desktop" `
    "$env:USERPROFILE\Documents" `
    "$env:USERPROFILE\Downloads"
Write-Host "✅ Filesystem MCP 安裝完成"

# 安裝 Playwright MCP（有視窗模式）
Write-Host "`n🌐 安裝 Playwright Chromium..."
& $npx -y playwright install chromium
Write-Host "✅ Chromium 安裝完成"

Write-Host "`n🎭 安裝 Playwright MCP（有視窗）..."
& $claude mcp add playwright -- & $npx -y @playwright/mcp --headed
Write-Host "✅ Playwright MCP 安裝完成"

# 顯示目前 MCP 清單
Write-Host "`n📋 目前已安裝的 MCP："
& $claude mcp list
