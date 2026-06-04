# VOID 標題字卡 - 動態影片 T02（開場）+ T03（結尾）
Set-Location 'C:\Users\User\Downloads\Sean windows agent'
& 'C:\Users\User\.libtv\libtv.exe' project use fb44ee1b41344312ab00c8ba07381e78

# T02 - 開場版：碎石字母飛入聚合
Write-Host "生成 T02 開場字卡..."
& 'C:\Users\User\.libtv\libtv.exe' node create 'VOID-T02-TitleCard-Intro' -t video `
  -s 'model=wanxiang-v2-6' -s 'modeType=frames2video' `
  -s 'duration=5' -s 'resolution=1080P' -s 'multiClip=1' `
  --left '93020777-3876-43fe-b1cd-12f32f9c89b4' `
  --prompt 'Dark void, shattered stone fragments and bold sans-serif letters V O I D drifting in slowly from edges of frame, converging toward center, cold blue light gradually intensifying as letters lock into position, floating debris settling, smooth slow motion cinematic reveal, deep black background, sharp glass crack details catching light' `
  --run 2>&1

# T03 - 結尾版：VOID 靜置後崩散
Write-Host "生成 T03 結尾字卡..."
& 'C:\Users\User\.libtv\libtv.exe' node create 'VOID-T03-TitleCard-Outro' -t video `
  -s 'model=wanxiang-v2-6' -s 'modeType=frames2video' `
  -s 'duration=5' -s 'resolution=1080P' -s 'multiClip=1' `
  --left '93020777-3876-43fe-b1cd-12f32f9c89b4' `
  --prompt 'Bold sans-serif letters V O I D holding still on pure black background, cold blue light refracting through crack lines, then glass fractures slowly spreading across each letter surface, letters and floating stone fragments breaking apart and drifting outward in all directions, slow motion disintegration, cold light fading as pieces scatter, cinematic ending fade to black' `
  --run 2>&1

Write-Host "T02 T03 done"
