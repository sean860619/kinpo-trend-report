# Phase 5 - V25-V30（2:30 延伸段落）
# Verse 2 / Bridge / Outro 補拍
Set-Location 'C:\Users\User\Downloads\Sean windows agent'
& 'C:\Users\User\.libtv\libtv.exe' project use fb44ee1b41344312ab00c8ba07381e78

# V25 - 男主新側角（Verse 2 開，1:30~1:40）
Write-Host "生成 V25 男主新側角..."
& 'C:\Users\User\.libtv\libtv.exe' node create 'VOID-V25-Verse2-MaleAngle' -t video `
  -s 'model=wanxiang-v2-6' -s 'modeType=frames2video' `
  -s 'duration=5' -s 'resolution=1080P' -s 'multiClip=1' `
  --left '1a29ca2b-5bda-4a35-8476-069a80a51dde' `
  --prompt 'Korean male model, new side profile angle in dark underground tunnel, cold blue neon backlight, lips subtly parting and closing in slow hip hop rhythm, melancholic searching expression, slow gentle push forward, dark mist drifting, smooth cinematic movement' `
  --run 2>&1

# V26 - 女主閉眼低頭（Verse 2 中，1:40~1:50）
Write-Host "生成 V26 女主閉眼低頭..."
& 'C:\Users\User\.libtv\libtv.exe' node create 'VOID-V26-Verse2-FemaleDown' -t video `
  -s 'model=wanxiang-v2-6' -s 'modeType=frames2video' `
  -s 'duration=5' -s 'resolution=1080P' -s 'multiClip=1' `
  --left '2e33d1f4-e2e4-45f2-9239-d1560335d220' `
  --prompt 'Korean female model close up, eyes slowly closing, head bowing forward in pain, single tear forming on cheek, cold blue side light, hair falling gently across face, mouth barely parted in silent exhale, raw emotional weight, smooth slow motion, dark gothic atmosphere' `
  --run 2>&1

# V27 - 男主極端特寫（Verse 2 末，1:50~2:00）
Write-Host "生成 V27 男主極端特寫..."
& 'C:\Users\User\.libtv\libtv.exe' node create 'VOID-V27-Verse2-MaleIntense' -t video `
  -s 'model=wanxiang-v2-6' -s 'modeType=frames2video' `
  -s 'duration=5' -s 'resolution=1080P' -s 'multiClip=1' `
  --left '1a29ca2b-5bda-4a35-8476-069a80a51dde' `
  --prompt 'Korean male model extreme close up face filling frame, intense raw gaze straight into camera, lips subtly moving with slow hip hop beat, cold hard directional light one side, deep shadow opposite, jaw set tight, unspoken pain behind eyes, static camera hold' `
  --run 2>&1

# V28 - 雙人對望剪影（Bridge，2:00~2:10）
Write-Host "生成 V28 雙人剪影Bridge..."
& 'C:\Users\User\.libtv\libtv.exe' node create 'VOID-V28-Bridge-TwoSilhouette' -t video `
  -s 'model=wanxiang-v2-6' -s 'modeType=frames2video' `
  -s 'duration=5' -s 'resolution=1080P' -s 'multiClip=1' `
  --left '2e33d1f4-e2e4-45f2-9239-d1560335d220' `
  --prompt 'Korean female and male silhouettes standing facing each other in abandoned dark space, wide emotional distance between them, cold blue backlight outlining both figures, low mist rising from ground, neither figure reaches toward the other, slow gentle camera pull back widening the space, cinematic bridge moment' `
  --run 2>&1

# V29 - 女主漸遠消散（Final Chorus，2:10~2:20）
Write-Host "生成 V29 女主漸遠消散..."
& 'C:\Users\User\.libtv\libtv.exe' node create 'VOID-V29-FinalChorus-Drift' -t video `
  -s 'model=wanxiang-v2-6' -s 'modeType=frames2video' `
  -s 'duration=5' -s 'resolution=1080P' -s 'multiClip=1' `
  --left '2e33d1f4-e2e4-45f2-9239-d1560335d220' `
  --prompt 'Korean female model full body, slow backward drift away from camera into dark void, cold blue light gradually fading on figure, becoming silhouette then darkness, hands at sides, faint breath mist visible, smooth slow motion recession, cinematic disappearance into black' `
  --run 2>&1

# V30 - VOID 太空字卡消散（Outro，2:20~2:30）
Write-Host "生成 V30 Outro VOID 消散..."
& 'C:\Users\User\.libtv\libtv.exe' node create 'VOID-V30-Outro-VoidFade' -t video `
  -s 'model=wanxiang-v2-6' -s 'modeType=frames2video' `
  -s 'duration=5' -s 'resolution=1080P' -s 'multiClip=1' `
  --left '9521481c-95de-4605-9722-afd9adec3ef0' `
  --prompt 'Deep space, VOID letters suspended still, cold blue light slowly dimming, rock fragments drifting apart in zero gravity, star field gradually darkening, letters fading letter by letter into pure black void, total silence and darkness, cinematic fade to nothing' `
  --run 2>&1

Write-Host "Phase 5 V25-V30 done"
