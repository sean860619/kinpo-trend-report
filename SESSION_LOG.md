# SESSION LOG — VOID Korean Hip Hop MV

> 每次 /compact 後自動更新此檔
> last active: 2026-06-04

---

## 已完成

- Phase 1（V01-V06）：6 段影片，Wan 2.6 生成
- Phase 2（V07-V16）：10 段影片，Wan 2.6 生成
- Phase 3 場景：底圖 S07-S12 + 玻璃疊加 C01-C02
- Phase 4（V17-V24）：8 段場景影片
- Phase 5（V25-V30）：6 段影片
- 標題字卡：T01 地面版確認、T02-v3 POV 爆裂版確認
- 剪輯合成：`VOID_MV_FINAL.mp4` 已生成
- 目錄整理：70+ 散落檔案移入 scripts/、assets/、references/、data/、reports/

---

## 當前進度

- 總影片段數：30 段（V01-V30）+ 標題字卡（T01, T02-v3）
- 本地片段：`VOID_clips/` 00_title ～ 29_V29 + `VOID_MV_SILENT.mp4` + `VOID_MV_FINAL.mp4`
- 尚未完成：特效後製（光效、轉場）、韓文字幕

---

## 下一步

1. 特效後製（光效、轉場）
2. 加入韓文字幕輸出最終版本

---

## 關鍵參數

| 項目 | 值 |
|---|---|
| 專案 UUID | `fb44ee1b41344312ab00c8ba07381e78` |
| 女主角節點 | `2e33d1f4-e2e4-45f2-9239-d1560335d220` |
| 男角色節點 | `1a29ca2b-5bda-4a35-8476-069a80a51dde` |
| 音樂節點 | `5bfe8120-aa58-4a2c-bac1-2baa8747bf24`（1:30）|
| 影片模型 | `wanxiang-v2-6`，modeType=`frames2video` |
| 圖片模型 | `seedream-5` |

---

## 已知注意事項

- PowerShell 中文驚嘆號 `！` 造成 parser error，改用英文 `!`
- 使用實人參考的鏡面反射場景用 `--left` 會被安全審核，改用 text2image
- `&` 放在 ps1 末行後不會結束，需加換行
