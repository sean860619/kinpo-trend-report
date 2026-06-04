# 重試 V26 女主閉眼低頭（移除敏感詞版）
Set-Location 'C:\Users\User\Downloads\Sean windows agent'
& 'C:\Users\User\.libtv\libtv.exe' project use fb44ee1b41344312ab00c8ba07381e78

Write-Host "重試 V26..."
& 'C:\Users\User\.libtv\libtv.exe' node create 'VOID-V26-Verse2-FemaleDown-v2' -t video `
  -s 'model=wanxiang-v2-6' -s 'modeType=frames2video' `
  -s 'duration=5' -s 'resolution=1080P' -s 'multiClip=1' `
  --left '2e33d1f4-e2e4-45f2-9239-d1560335d220' `
  --prompt 'Korean female model close up, eyes gently closing, head slowly bowing forward, cold blue side light on face, hair falling softly across face, mouth softly parted, deep emotional expression, smooth slow motion, dark cinematic atmosphere' `
  --run 2>&1

Write-Host "V26 retry done"
