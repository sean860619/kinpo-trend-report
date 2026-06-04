$REPO = "C:\Users\User\Downloads\Sean windows agent"
Set-Location $REPO

# 有變更才 commit
$status = git status --porcelain
if ($status) {
    git add "*.md"
    git add "*.ps1"
    git add "**/*.md"
    git add "**/*.ps1"
    $date = Get-Date -Format "yyyy-MM-dd HH:mm"
    git commit -m "auto backup: $date"
}

# 不論有無新 commit，都補 push（確保之前失敗的 push 補上）
git push origin master
