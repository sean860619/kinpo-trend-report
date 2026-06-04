# 重拍 V27 - 改中景半身，加場景感，移除嘴型描述
Set-Location 'C:\Users\User\Downloads\Sean windows agent'
& 'C:\Users\User\.libtv\libtv.exe' project use fb44ee1b41344312ab00c8ba07381e78

Write-Host "重拍 V27 中景半身版..."
& 'C:\Users\User\.libtv\libtv.exe' node create 'VOID-V27-Verse2-MaleIntense-v2' -t video `
  -s 'model=wanxiang-v2-6' -s 'modeType=frames2video' `
  -s 'duration=5' -s 'resolution=1080P' -s 'multiClip=1' `
  --left '1a29ca2b-5bda-4a35-8476-069a80a51dde' `
  --prompt 'Korean male model medium shot half body, standing in dark abandoned space, cold blue atmospheric light from above casting deep shadow, intense silent forward gaze, dark weathered stone wall behind, low ground mist drifting, natural stillness, slow subtle camera push, cinematic dark portrait' `
  --run 2>&1

Write-Host "V27 v2 done"
