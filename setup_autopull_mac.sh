#!/bin/bash
REPO_URL="https://github.com/sean860619/kinpo-trend-report.git"
REPO_DIR="$HOME/Documents/sean-agent"
PLIST="$HOME/Library/LaunchAgents/com.sean.autopull.plist"
SCRIPT="$REPO_DIR/auto_pull.sh"

# 若尚未 clone 就先 clone
if [ ! -d "$REPO_DIR" ]; then
    git clone "$REPO_URL" "$REPO_DIR"
fi

# 建立 pull 腳本（等網路通才執行）
cat > "$SCRIPT" << 'EOF'
#!/bin/bash
# 等待網路連線（最多等 60 秒）
for i in $(seq 1 12); do
    ping -c 1 -W 2 github.com &>/dev/null && break
    sleep 5
done
cd "$HOME/Documents/sean-agent" && git pull origin master
EOF
chmod +x "$SCRIPT"

# 建立 launchd plist（開機執行 + 每天 12:00）
cat > "$PLIST" << EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.sean.autopull</string>
    <key>ProgramArguments</key>
    <array>
        <string>/bin/bash</string>
        <string>$SCRIPT</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
    <key>StartCalendarInterval</key>
    <dict>
        <key>Hour</key>
        <integer>12</integer>
        <key>Minute</key>
        <integer>0</integer>
    </dict>
    <key>StandardOutPath</key>
    <string>/tmp/sean-autopull.log</string>
    <key>StandardErrorPath</key>
    <string>/tmp/sean-autopull-error.log</string>
</dict>
</plist>
EOF

# 載入 launchd agent
launchctl unload "$PLIST" 2>/dev/null
launchctl load "$PLIST"

echo "Done! Repo: $REPO_DIR"
echo "Auto pull: every login + daily 12:00, waits for network"
