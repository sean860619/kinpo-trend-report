# 生成 VOID MV 全部 6 部影片片段（Wan 2.6 + multiClip，對應歌曲時間軸）
# 時間軸：V01(0:00) V06(0:06) V02(0:25) V03(0:40) V05(0:46) V04(0:55)
Set-Location 'C:\Users\User\Downloads\Sean windows agent'
& 'C:\Users\User\.libtv\libtv.exe' project use fb44ee1b41344312ab00c8ba07381e78

# 下載並上傳 Scene03/04 的指定起始幀
Write-Host "準備 Scene03 起始幀..."
Invoke-WebRequest -Uri "https://libtv-res.liblib.art/sd-gen-save-img/genius_playground/image/a088e7b0de6e4ffdbaabb9d602864978/747999762_912c805ac2da405a8fc9e6151119bca1.png" -OutFile "scene03_frame.png"
$s03 = (& 'C:\Users\User\.libtv\libtv.exe' upload 'VOID-S03-Frame' -f 'scene03_frame.png' -t image 2>&1 | ConvertFrom-Json).nodeKey
Write-Host "Scene03 frame node: $s03"

Write-Host "準備 Scene04 起始幀..."
Invoke-WebRequest -Uri "https://libtv-res.liblib.art/sd-gen-save-img/genius_playground/image/a088e7b0de6e4ffdbaabb9d602864978/748001927_5c28eebc8eeb4145bbd8e1fcccdd132e.png" -OutFile "scene04_frame.png"
$s04 = (& 'C:\Users\User\.libtv\libtv.exe' upload 'VOID-S04-Frame' -f 'scene04_frame.png' -t image 2>&1 | ConvertFrom-Json).nodeKey
Write-Host "Scene04 frame node: $s04"

# V01 - 臉部特寫A（Verse 0:00） - Zoom in 隨 Verse 第一句入場
Write-Host "生成 V01 臉部特寫A（Verse 開場）..."
& 'C:\Users\User\.libtv\libtv.exe' node create 'VOID-V01-Verse-Open' -t video `
  -s 'model=wanxiang-v2-6' -s 'modeType=frames2video' `
  -s 'duration=5' -s 'resolution=1080P' -s 'multiClip=1' `
  --left 'f021fcbf-5d35-4dd2-bda0-af4cc7e6b322' `
  --prompt 'Korean female model, close up face, slow zoom in, single tear falling down cheek, cold blue neon light, empty upward gaze, hair drifting softly, dark gothic atmosphere, slow Korean hip hop beat energy, cinematic MV opening shot' `
  --run 2>&1

# V06 - 男主角雨中（Verse 0:06） - 交替切入男角
Write-Host "生成 V06 男主角雨中（Verse 交替）..."
& 'C:\Users\User\.libtv\libtv.exe' node create 'VOID-V06-Verse-Male' -t video `
  -s 'model=wanxiang-v2-6' -s 'modeType=frames2video' `
  -s 'duration=5' -s 'resolution=1080P' -s 'multiClip=1' `
  --left 'a67306a2-571d-4ce9-8f7a-e2eaf06eaf5b' `
  --prompt 'Korean male model, face in heavy rain, tracking shot forward, intense determined gaze, water drops on skin, neon reflections on wet ground, dark leather jacket, hip hop street energy, cinematic rain MV shot' `
  --run 2>&1

# V02 - 臉部特寫B（Pre-Chorus 0:25） - 情緒開始升溫
Write-Host "生成 V02 臉部特寫B（Pre-Chorus）..."
& 'C:\Users\User\.libtv\libtv.exe' node create 'VOID-V02-PreChorus' -t video `
  -s 'model=wanxiang-v2-6' -s 'modeType=frames2video' `
  -s 'duration=5' -s 'resolution=1080P' -s 'multiClip=1' `
  --left '061ebdb5-4688-4d0e-8789-ec726510fccb' `
  --prompt 'Korean female model, close up face with side lighting, camera panning slowly left, smoke wisps drifting across face, melancholic empty gaze, lips slightly trembling, building emotional tension before chorus drop' `
  --run 2>&1

# V03 - 半身伸手（Chorus 0:40） - Chorus 爆發
Write-Host "生成 V03 半身伸手（Chorus 爆發）..."
& 'C:\Users\User\.libtv\libtv.exe' node create 'VOID-V03-Chorus-Reach' -t video `
  -s 'model=wanxiang-v2-6' -s 'modeType=frames2video' `
  -s 'duration=5' -s 'resolution=1080P' -s 'multiClip=1' `
  --left $s03 `
  --prompt 'Korean female model, half body, camera pulling out fast, arms desperately reaching toward camera, dark smoke explosion around her, intense emotional raw expression, chorus energy burst, cinematic MV power shot' `
  --run 2>&1

# V05 - 雙人玻璃（Chorus 高峰 0:46）
Write-Host "生成 V05 雙人玻璃（Chorus 高峰）..."
& 'C:\Users\User\.libtv\libtv.exe' node create 'VOID-V05-Chorus-Glass' -t video `
  -s 'model=wanxiang-v2-6' -s 'modeType=frames2video' `
  -s 'duration=5' -s 'resolution=1080P' -s 'multiClip=1' `
  --left '5e720d66-0ba4-430a-9ffe-f767645bbf68' `
  --prompt 'Korean man and woman separated by glass wall, woman pressing palm on glass, man reaching from rain outside, rain streaks flowing down glass, emotional peak moment, cold blue and amber split lighting, chorus climax energy' `
  --run 2>&1

# V04 - 全身廢墟（Final Chorus 0:55）
Write-Host "生成 V04 全身廢墟（Final Chorus）..."
& 'C:\Users\User\.libtv\libtv.exe' node create 'VOID-V04-FinalChorus' -t video `
  -s 'model=wanxiang-v2-6' -s 'modeType=frames2video' `
  -s 'duration=5' -s 'resolution=1080P' -s 'multiClip=1' `
  --left $s04 `
  --prompt 'Korean female model, full body in dark ruins, blue light shafts intensifying dramatically from above, ground fog swirling fast, dress fabric billowing, final chorus power moment, VOID title card energy, cinematic wide shot' `
  --run 2>&1

Write-Host "全部 6 部影片生成完成！"
