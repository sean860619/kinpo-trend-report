# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Environment

This workspace runs inside **wmux** — a terminal multiplexer with a live browser panel visible to the user.

For all web browsing, use `wmux browser` commands so the user can watch in the browser panel:

```bash
wmux browser open <url>       # 導航到頁面
wmux browser snapshot         # 取得無障礙樹（含 @eN 參照）
wmux browser click @eN        # 點擊元素
wmux browser type @eN <text>  # 輸入文字
wmux browser fill @eN <value> # 設定欄位值
wmux browser get-text         # 取得頁面文字
wmux browser screenshot       # 截圖
wmux browser eval <js>        # 執行 JavaScript
wmux browser back / forward / reload
```

Workflow: `open` → `snapshot` → read `@eN` refs → interact → `snapshot` again. Refs expire on page changes.

## Security Setup（安全三件套）

已完成以下三層安全設定：

### 第一層：安全刪除
- `rr <路徑>` — 移至資源回收筒（可還原）
- `rm <路徑>` — 同上（已覆寫預設 rm）
- `rmf <路徑>` — 永久刪除（Remove-Item -Force）
- 設定位置：`C:\Users\User\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1`

### 第二層：危險指令黑名單（24 條）
寫入 `~/.claude/settings.json`，以下類別 AI 直接拒絕：
- 遞迴刪除（rm -rf 各種變體）
- sudo / 權限提升
- 磁碟格式化（dd、diskpart、Format-Volume）
- chmod 777 / icacls 全開
- Git 毀壞操作（reset --hard、push --force、clean -f、branch -D）
- 系統關機（shutdown、reboot、Restart-Computer）
- 檔案清空（truncate、: >）

### 第三層：權限模式
- 目前設定：`bypassPermissions`（全自動，黑名單持續守護）
- 變更方式：修改 `~/.claude/settings.json` 的 `permissions.defaultMode`
  - `acceptEdits` — 改檔案免問、跑指令要確認（推薦新手）
  - `default` — 每個動作都問
  - `plan` — 只規劃不執行

## Configured Permissions

預先核准（`.claude/settings.local.json`）：
- `WebFetch` for `raw.githubusercontent.com`, `github.com`, `www.npmjs.com`, `moksaweb.com`
- `Bash(gh repo *)` / `Bash(gh search *)`
- `Bash(wmux browser *)`

## Quick Commands

| 指令 | 功能 |
|---|---|
| `cc` | 啟動 Claude Code（切換到專案目錄）|
| `rr <路徑>` | 安全刪除（移至資源回收筒）|
| `claude-status` | 查看目前所有設定狀態 |
| `claude --version` | 查看版本 |

## Custom Slash Commands

- `/morning` — 早晨日報：讀取 Gmail（昨日）、Google Calendar（今日）、Notion 任務，彙整成每日摘要

## LibTV 工作規則

使用 LibTV 進行 AI 創作時，請遵守 @LIBTV.md 的所有規則。
核心：**先規劃企劃表 → 使用者確認 → 才執行 CLI 指令。**

## LibTV CLI Skill（官方完整指令文件）

@.libtv-skill/SKILL.md

操作 LibTV CLI 時，以上方官方 Skill 文件為準；指令細節參考 `.libtv-skill/commands/`，範例參考 `.libtv-skill/examples/`。
CLI 執行路徑：`C:\Users\User\.libtv\libtv.exe`

## 自動備份設定

每天 12:00 自動執行（錯過時一連網就補跑）：

| 排程名稱 | 功能 | 腳本 |
|---|---|---|
| `GitAutoCommit-SeanAgent` | git commit + push 到 GitHub | `auto_commit.ps1` |
| `SyncToDrive-SeanAgent` | 同步 `.md`/`.ps1` 到 Google Drive | `sync_to_drive.ps1` |

### GitHub
- Remote：`https://github.com/sean860619/kinpo-trend-report.git`
- Branch：`master`
- 備份範圍：`.md`、`.ps1`（圖片/影片由 `.gitignore` 排除）

### Google Drive
- 工具：rclone v1.74.2（位於 `%LOCALAPPDATA%\Microsoft\WinGet\Packages\Rclone.Rclone_*\`）
- Remote 名稱：`gdrive`
- Drive 目標資料夾：`Sean-windows-agent`
- 備份範圍：`.md`、`.ps1`

### 其他裝置自動同步
- **另一台 Windows**：執行 `setup_autopull_windows.ps1`，Repo 位置 `~/Documents/sean-agent`
- **Mac**：執行 `setup_autopull_mac.sh`，使用 launchd，登入時 + 每天 12:00 補跑

## Interaction Rules

- 修改檔案前，先列出要動哪些檔案，等確認再動
- 一次只做一件事，做完再問下一步
- 不要自動安裝套件，先告訴套件名稱和用途再安裝
- 程式碼加中文註解
- 禁止刪除任何檔案，除非明確說「刪除」
- `.env` / `.env.local` 檔案不能動
