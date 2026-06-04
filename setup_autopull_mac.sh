#!/bin/bash
REPO_URL="https://github.com/sean860619/kinpo-trend-report.git"
REPO_DIR="$HOME/Documents/sean-agent"

# 若尚未 clone 就先 clone
if [ ! -d "$REPO_DIR" ]; then
    git clone "$REPO_URL" "$REPO_DIR"
fi

# 寫入 crontab：每天 12:00 自動 pull
CRON_JOB="0 12 * * * cd \"$REPO_DIR\" && git pull origin master"
(crontab -l 2>/dev/null | grep -v "sean-agent"; echo "$CRON_JOB") | crontab -

echo "Done! Repo: $REPO_DIR"
echo "Auto pull scheduled daily at 12:00"
