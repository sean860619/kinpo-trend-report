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

## Configured Permissions

The following are pre-approved in `.claude/settings.local.json`:

- `WebFetch` for `raw.githubusercontent.com`, `github.com`, `www.npmjs.com`, `moksaweb.com`
- `Bash(gh repo *)` and `Bash(gh search *)`
- `Bash(wmux browser *)`

## Interaction Rules

- 修改檔案前，先列出要動哪些檔案，等確認再動
- 一次只做一件事，做完再問下一步
- 不要自動安裝套件，先告訴套件名稱和用途再安裝
- 程式碼加中文註解
- 禁止刪除任何檔案，除非明確說「刪除」
- `.env` / `.env.local` 檔案不能動
- 禁止 `git push --force`
