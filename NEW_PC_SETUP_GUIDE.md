# 新電腦完整設定手冊

> 從零到完成，包含所有步驟、軟體、網址、指令。
> 預計總時間：15-20 分鐘

---

## 最速流程（3 個動作搞定）

> 詳細步驟請看下方各 Step，這裡是給你快速對齊用的。

### 舊電腦：執行一次備份
```powershell
cd "C:\Users\User\Downloads\Sean windows agent"
.\scripts\system\backup_to_drive.ps1
```

### 新電腦：前置（唯一無法自動化的事）
從 Google Drive 網頁下載 `pc-backup/rclone/rclone.conf`，放到：
```
C:\Users\<帳號>\AppData\Roaming\rclone\rclone.conf
```

### 新電腦：一鍵指令（貼進 PowerShell 系統管理員，按 Enter）
```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force; Invoke-WebRequest "https://raw.githubusercontent.com/sean860619/kinpo-trend-report/master/setup_new_pc.ps1" -OutFile "$env:TEMP\sean_setup.ps1"; & "$env:TEMP\sean_setup.ps1"
```

這一行自動完成：安裝所有軟體 → 建立資料夾 → 套用設定 → 從 Google Drive 還原備份。

### 跑完後最後 3 件事
```powershell
claude login
```
```
前往 https://wmux.dev 下載 wmux → 解壓到 Downloads
```
```powershell
claude-status
```

---

## 總覽

```
舊電腦（現在）          新電腦
─────────────           ──────────────────────────────────────
Step 0                  前置        一鍵指令         完成
備份到 Google Drive     rclone.conf setup_new_pc.ps1 claude login
（1 個指令）            （手動）    （全自動 12 步）  + wmux
```

---

# ═══════════════════════════
# 舊電腦：先做這一步
# ═══════════════════════════

## Step 0 — 備份設定到 Google Drive

**在哪裡執行：** 現在這台電腦的 PowerShell

**開啟 PowerShell：**
- 按 `Win` 鍵 → 搜尋 `PowerShell` → 點擊開啟（不需要系統管理員）

**執行備份：**
```powershell
cd "C:\Users\User\Downloads\Sean windows agent"
.\scripts\system\backup_to_drive.ps1
```

**預期結果：**
```
OK  libtv\libtv.exe
OK  libtv\credentials.json
OK  rclone\rclone.conf
OK  claude-memory\MEMORY.md
OK  claude-memory\feedback_language.md
... （共約 8 個檔案）
備份完成！
```

**確認上傳成功：**
- 開啟瀏覽器前往 Google Drive
- 確認 `Sean-windows-agent/pc-backup/` 資料夾存在

---

# ═══════════════════════════
# 新電腦：從這裡開始
# ═══════════════════════════

## Step 1 — 前置（唯一需要手動的事）

### 取得 rclone.conf

**為什麼要手動：** rclone 設定檔在 Google Drive 上，但沒設定 rclone 就無法連 Google Drive，所以這個檔案要用瀏覽器手動下載。

1. 開啟瀏覽器，登入 Google Drive
2. 進入 `Sean-windows-agent` → `pc-backup` → `rclone` 資料夾
3. 下載 `rclone.conf`
4. 手動建立目錄並放入：
   ```
   C:\Users\<你的帳號>\AppData\Roaming\rclone\rclone.conf
   ```

---

## Step 2 — 一鍵指令（Git / 軟體 / 設定 / 還原 全自動）

**開啟 PowerShell（系統管理員）：**
- 按 `Win` 鍵 → 搜尋 `PowerShell`
- 對 **Windows PowerShell** 按右鍵 → **以系統管理員身分執行**

**貼上這一行，按 Enter：**
```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force; Invoke-WebRequest "https://raw.githubusercontent.com/sean860619/kinpo-trend-report/master/setup_new_pc.ps1" -OutFile "$env:TEMP\sean_setup.ps1"; & "$env:TEMP\sean_setup.ps1"
```

**這一行自動完成以下 12 個步驟：**

| 步驟 | 內容 | 時間 |
|---|---|---|
| Step 1 | 安裝 VS Code、Node.js、yt-dlp、rclone | 約 5 分鐘 |
| Step 2 | 安裝 Claude Code CLI | 約 1 分鐘 |
| Step 3 | 確認 wmux 路徑 | 即時 |
| Step 4 | 建立所有資料夾結構 | 即時 |
| Step 5 | git pull 更新專案 | 約 30 秒 |
| Step 6 | 建立 ~/.claude 目錄 | 即時 |
| Step 7 | 寫入 settings.json（24 條黑名單）| 即時 |
| Step 8 | 建立 ~/.claude/CLAUDE.md | 即時 |
| Step 9 | 設定 PowerShell Profile | 即時 |
| Step 10 | 更新腳本路徑 + 建立排程工作 | 即時 |
| Step 11 | 確認 LibTV 目錄 | 即時 |
| Step 12 | 從 Google Drive 還原備份 | 約 1 分鐘 |

**正常完成的樣子：**
```
[1/12] 安裝基礎軟體...
  OK  VS Code
  OK  Node.js LTS
  ...
[12/12] 從 Google Drive 還原備份...
  OK  LibTV 已還原（免重新登入）
  OK  Claude 記憶檔已還原
  OK  Slash command model.md 已還原

設定完成！
```

---

## Step 3 — 手動完成最後幾件事

### 3-A：安裝 Claude Code VS Code 擴充套件

1. 開啟 VS Code（開始選單搜尋 `Visual Studio Code`）
2. 點擊左側 Extensions 圖示（或按 `Ctrl+Shift+X`）
3. 搜尋 `Claude Code`
4. 找到 **Anthropic** 官方出品的擴充套件
5. 點擊 **Install**

---

### 3-B：安裝 wmux

1. 開啟瀏覽器前往：`https://wmux.dev`
2. 點擊 **Download for Windows**
3. 解壓縮後整個資料夾移到：
   ```
   C:\Users\<帳號>\Downloads\wmux-0.8.0-win-x64\
   ```
   確認裡面有 `wmux.exe`

---

### 3-C：登入 Claude Code

**開啟新的 PowerShell（不需要系統管理員）：**
```powershell
claude login
```

瀏覽器自動開啟，用 Anthropic 帳號登入授權。

---

### 3-D：重新開啟 PowerShell 讓設定生效

關閉所有 PowerShell 視窗，重新開啟一個，執行：
```powershell
claude-status
```

預期輸出：
```
=== Claude Code Status ===
Version: 1.x.x
Permission mode: bypassPermissions
Deny rules: 24
Safe delete (rr): OK
```

---

## Step 4 — 全面驗證

逐項確認，全部 OK 才算完成：

### 基礎環境
```powershell
git --version
```
```powershell
node --version
```
```powershell
claude --version
```

### Claude 設定
```powershell
claude-status
```

### 雲端同步
```powershell
rclone listremotes
```
應顯示 `gdrive:`

### LibTV
```powershell
libtv --version
```

### 專案捷徑
```powershell
cc
```
應自動進入 `Sean windows agent` 目錄並啟動 Claude Code。

### wmux（最後確認）
直接點擊執行 wmux 應用程式，確認瀏覽器面板出現在右側。

---

## 常見問題

### Q：腳本執行時出現「無法載入...因為在此系統上禁止執行腳本」
```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### Q：Step 12 顯示「gdrive 尚未設定，跳過還原」
確認 rclone.conf 已放到正確位置：
```
C:\Users\<帳號>\AppData\Roaming\rclone\rclone.conf
```
然後手動執行還原：
```powershell
.\scripts\system\restore_from_drive.ps1
```

### Q：`cc` 指令不存在
PowerShell Profile 還未生效，關閉重開 PowerShell。

### Q：wmux 路徑不符
如果 wmux 解壓位置不同，修改 `~/.claude/settings.json` 中的 wmux-hook.js 路徑。

---

## 設定完成後的日常使用

| 要做什麼 | 方法 |
|---|---|
| 啟動 Claude Code | 開啟 wmux → 輸入 `cc` |
| 讓 Claude 操作瀏覽器 | wmux 右側面板即時顯示 |
| 操作 LibTV | 在 wmux 內對 Claude 說明需求 |
| 安全刪除檔案 | `rr 路徑` |
| 查看設定 | `claude-status` |
| 手動備份 | `.\scripts\system\auto_commit.ps1` |
| 手動同步 Drive | `.\scripts\system\sync_to_drive.ps1` |
| 排程備份時間 | 每天 12:00 自動執行（錯過補跑）|

---

## 檔案位置速查

| 檔案 | 路徑 |
|---|---|
| 黑名單設定 | `~\.claude\settings.json` |
| 全域規則 | `~\.claude\CLAUDE.md` |
| 專案規則 | `專案目錄\CLAUDE.md` |
| Claude 記憶 | `~\.claude\projects\...\memory\` |
| LibTV 執行檔 | `~\.libtv\libtv.exe` |
| LibTV 憑證 | `~\.libtv\credentials.json` |
| rclone 設定 | `~\AppData\Roaming\rclone\rclone.conf` |
| PowerShell 設定 | `~\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1` |
| 備份腳本 | `專案目錄\scripts\system\backup_to_drive.ps1` |
| 還原腳本 | `專案目錄\scripts\system\restore_from_drive.ps1` |
| 安裝腳本 | `專案目錄\setup_new_pc.ps1` |
