# SESSION LOG — VOID Korean Hip Hop MV

> 每次 /compact 後自動更新此檔

---

## 最後更新：2026-06-03

---

## 已完成

- **Phase 1**（V01-V06）：6 支影片段，Wan 2.6 生成 ✅
- **Phase 2**（V07-V16）：10 支補間影片段，Wan 2.6 生成 ✅
- **Phase 3 場景圖**：8 個場景節點全部生成並由使用者確認 ✅
  - S07 廢棄教堂 `c7902480-a71c-4e72-be68-91581813f1b4`
  - S08 教堂近景 `12163465-71e5-4662-9ea6-7342fa1b98d7`
  - S09 地下通道遠景 `72281862-28db-4dd7-9af0-05b499a73e17`
  - S10 地下通道側牆 `b5fdf83a-f118-4f48-a6f6-52ed6ab3b562`
  - S11 破碎鏡面 v2 `7c1fd587-aa7b-40d9-a8bb-6febd2585856`
  - S12 破碎玻璃特寫 v2 `6bffe654-2495-471f-93ac-1b6bd8b68dd7`
  - C01 破碎玻璃疊加女主角 `17235391-818e-4f2f-ba88-ad3d9f3b8ee1`
  - C02 破碎玻璃疊加男主角 `5b03b46f-eaeb-4f23-96a9-84ea07ea4960`

---

## 當前進度

- **Phase 4（Phase 3 影片段 V17-V24）：等待執行確認**
- 企劃表已呈現，使用者尚未回覆「確認執行」
- 所有影片將使用 Wan 2.6，5秒，1080P，multiClip=1

| # | 名稱 | 來源節點 |
|---|---|---|
| V17 | Church-LightRay | S07 `c7902480` |
| V18 | Church-Detail | S08 `12163465` |
| V19 | Tunnel-Wide | S09 `72281862` |
| V20 | Tunnel-Wall | S10 `b5fdf83a` |
| V21 | Mirror-Scatter | S11 `7c1fd587` |
| V22 | Mirror-Close | S12 `6bffe654` |
| V23 | GlassFace-Female | C01 `17235391` |
| V24 | GlassFace-Male | C02 `5b03b46f` |

---

## 下一步

1. **使用者確認 V17-V24 企劃表** → 執行 `gen_phase4_videos.ps1`
2. **VOID 標題字卡**：「V O I D」分裂感設計（使用者指定最後做）
3. **最終剪輯**：所有影片段 + 音樂 + 韓文歌詞字幕

---

## 重要參數備忘

- **LibTV 專案 UUID**：`fb44ee1b41344312ab00c8ba07381e78`
- **Canvas**：https://www.liblib.tv/canvas?projectId=fb44ee1b41344312ab00c8ba07381e78
- **女主角節點**：`2e33d1f4-e2e4-45f2-9239-d1560335d220`
- **男主角節點**：`1a29ca2b-5bda-4a35-8476-069a80a51dde`
- **音樂節點**：`5bfe8120-aa58-4a2c-bac1-2baa8747bf24`（1:30）
- **影片模型**：`wanxiang-v2-6`，modeType=`frames2video`
- **圖片模型**：`seedream-5`（非 seedream-5.0）
- **mj-v7** 限制：count 必須為 4，quality 必須為 auto

---

## 已知注意事項

- PowerShell 中文全形驚嘆號 `！` 會造成 parser error → 用英文 `!` 或移除
- 使用真實人臉圖作為鏡面反射場景的 `--left` 會被安全審核擋 → 改用純 text2image
- `&` 放在 ps1 最後一行會造成提前結束
