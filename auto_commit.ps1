$REPO = "C:\Users\User\Downloads\Sean windows agent"
Set-Location $REPO

# 檢查是否有變更
$status = git status --porcelain
if (-not $status) {
    exit 0
}

# 只加入 .md 和 .ps1
git add "*.md"
git add "*.ps1"
git add "**/*.md"
git add "**/*.ps1"

# 用日期當 commit 訊息
$date = Get-Date -Format "yyyy-MM-dd HH:mm"
git commit -m "auto backup: $date"

# push 到 GitHub
git push origin master
