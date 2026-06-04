# Phase 2 - 補齊 10 段影片（流暢運鏡版）
# 時間軸：V07(0:11) V08(0:16) V09(0:21) V10(0:30) V11(0:35)
#          V12(0:51) V13(1:00) V14(1:05) V15(1:15) V16(1:20)
Set-Location 'C:\Users\User\Downloads\Sean windows agent'
& 'C:\Users\User\.libtv\libtv.exe' project use fb44ee1b41344312ab00c8ba07381e78

# V07 - 男主角側行（Verse 0:11）
Write-Host "生成 V07 男主角側行..."
& 'C:\Users\User\.libtv\libtv.exe' node create 'VOID-V07-Verse-MaleWalk' -t video `
  -s 'model=wanxiang-v2-6' -s 'modeType=frames2video' `
  -s 'duration=5' -s 'resolution=1080P' -s 'multiClip=1' `
  --left 'a67306a2-571d-4ce9-8f7a-e2eaf06eaf5b' `
  --prompt 'Korean male model, side profile slow walk, smooth lateral tracking shot, heavy rain streaks, water droplets on dark leather jacket, neon light reflections on wet pavement, slow steady cinematic movement, dark hip hop MV atmosphere' `
  --run 2>&1

# V08 - 女主角睫毛淚珠特寫（Verse 0:16）
Write-Host "生成 V08 女主角睫毛淚珠..."
& 'C:\Users\User\.libtv\libtv.exe' node create 'VOID-V08-Verse-FemaleEyes' -t video `
  -s 'model=wanxiang-v2-6' -s 'modeType=frames2video' `
  -s 'duration=5' -s 'resolution=1080P' -s 'multiClip=1' `
  --left 'f021fcbf-5d35-4dd2-bda0-af4cc7e6b322' `
  --prompt 'Korean female model, extreme macro close up, single tear slowly forming on lower eyelid, very gentle smooth zoom in, cold blue neon light refracting through tear, soft eyelash detail, minimal subtle movement, emotionally charged cinematic macro shot' `
  --run 2>&1

# V09 - 女主角側臉轉向（Verse 0:21）
Write-Host "生成 V09 女主角側臉轉向..."
& 'C:\Users\User\.libtv\libtv.exe' node create 'VOID-V09-Verse-FaceTurn' -t video `
  -s 'model=wanxiang-v2-6' -s 'modeType=frames2video' `
  -s 'duration=5' -s 'resolution=1080P' -s 'multiClip=1' `
  --left '061ebdb5-4688-4d0e-8789-ec726510fccb' `
  --prompt 'Korean female model, side profile, smooth slow head turn toward camera, smoke wisps drifting across face, cold blue backlight outlining silhouette, gentle smooth camera push forward, melancholic empty expression, dark gothic atmosphere' `
  --run 2>&1

# V10 - 女主角情緒崩潰（Pre-Chorus 0:30）
Write-Host "生成 V10 女主角情緒崩潰..."
& 'C:\Users\User\.libtv\libtv.exe' node create 'VOID-V10-PreChorus-Breakdown' -t video `
  -s 'model=wanxiang-v2-6' -s 'modeType=frames2video' `
  -s 'duration=5' -s 'resolution=1080P' -s 'multiClip=1' `
  --left '2e33d1f4-e2e4-45f2-9239-d1560335d220' `
  --prompt 'Korean female model, close up face, hands slowly rising to cover face, smooth slow motion, tears streaming down cheeks, trembling lips, cold blue and amber split lighting, deep emotional breakdown, building tension before chorus' `
  --run 2>&1

# V11 - 玻璃手掌印特寫（Pre-Chorus 0:35）
Write-Host "生成 V11 玻璃手掌印特寫..."
& 'C:\Users\User\.libtv\libtv.exe' node create 'VOID-V11-PreChorus-GlassDetail' -t video `
  -s 'model=wanxiang-v2-6' -s 'modeType=frames2video' `
  -s 'duration=5' -s 'resolution=1080P' -s 'multiClip=1' `
  --left '5e720d66-0ba4-430a-9ffe-f767645bbf68' `
  --prompt 'Condensation water droplets on glass wall, smooth slow dolly across surface, handprint impression with fingertip details, rain streaks falling outside glass, soft focus separation, cold blue ambient light, melancholic longing atmosphere, cinematic detail insert shot' `
  --run 2>&1

# V12 - 女主角旋轉慢動作（Chorus 0:51）
Write-Host "生成 V12 女主角旋轉..."
& 'C:\Users\User\.libtv\libtv.exe' node create 'VOID-V12-Chorus-Spin' -t video `
  -s 'model=wanxiang-v2-6' -s 'modeType=frames2video' `
  -s 'duration=5' -s 'resolution=1080P' -s 'multiClip=1' `
  --left '9e39611f-1c99-4fb8-9319-c34756549cad' `
  --prompt 'Korean female model, half body, smooth slow rotation in place, dark velvet dress fabric billowing outward, blue glowing particles scattering, dark smoke swirling, ethereal slow motion, smooth continuous circular camera orbit, chorus emotional peak energy' `
  --run 2>&1

# V13 - 男主角全身廢墟（Final Chorus 1:00）
Write-Host "生成 V13 男主角全身廢墟..."
& 'C:\Users\User\.libtv\libtv.exe' node create 'VOID-V13-FinalChorus-MaleRuins' -t video `
  -s 'model=wanxiang-v2-6' -s 'modeType=frames2video' `
  -s 'duration=5' -s 'resolution=1080P' -s 'multiClip=1' `
  --left '1a29ca2b-5bda-4a35-8476-069a80a51dde' `
  --prompt 'Korean male model, full body, dramatic blue light shafts falling from above, smooth slow tilt down from face to full standing figure, dark ruins environment, ground fog rolling, intense final chorus energy, powerful cinematic wide shot' `
  --run 2>&1

# V14 - 女主角仰頭光柱（Final Chorus 1:05）
Write-Host "生成 V14 女主角仰頭光柱..."
& 'C:\Users\User\.libtv\libtv.exe' node create 'VOID-V14-FinalChorus-FemaleRise' -t video `
  -s 'model=wanxiang-v2-6' -s 'modeType=frames2video' `
  -s 'duration=5' -s 'resolution=1080P' -s 'multiClip=1' `
  --left 'a00e913e-6eca-49af-9e57-f9d0c6de35d4' `
  --prompt 'Korean female model, medium close up, smooth slow tilt up from chin to eyes looking upward, intense blue light shafts piercing from above, tears catching light, emotional release ascending movement, final chorus power moment, cinematic slow motion' `
  --run 2>&1

# V15 - 雙人背對背剪影（Final Chorus 1:15）
Write-Host "生成 V15 雙人背對背剪影..."
& 'C:\Users\User\.libtv\libtv.exe' node create 'VOID-V15-FinalChorus-Silhouette' -t video `
  -s 'model=wanxiang-v2-6' -s 'modeType=frames2video' `
  -s 'duration=5' -s 'resolution=1080P' -s 'multiClip=1' `
  --left '5e720d66-0ba4-430a-9ffe-f767645bbf68' `
  --prompt 'Korean woman and man, back to back silhouette, smooth slow pull back dolly out, growing space between them, golden and blue particles dissolving into air, dark moody background, final emotional separation, ethereal cinematic ending shot' `
  --run 2>&1

# V16 - 女主角手指消散（Final Chorus 1:20）
Write-Host "生成 V16 女主角手指消散..."
& 'C:\Users\User\.libtv\libtv.exe' node create 'VOID-V16-FinalChorus-Fade' -t video `
  -s 'model=wanxiang-v2-6' -s 'modeType=frames2video' `
  -s 'duration=5' -s 'resolution=1080P' -s 'multiClip=1' `
  --left '2e33d1f4-e2e4-45f2-9239-d1560335d220' `
  --prompt 'Korean female model, close up outstretched hand reaching slowly upward, smooth gentle zoom out, fingers dissolving into glowing blue particles, dark void background, final moment of release, ethereal fade out, cinematic VOID title energy' `
  --run 2>&1

Write-Host "Phase 2 全部 10 段影片生成完成！"
