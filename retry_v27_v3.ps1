# 重拍 V27 v3 - 傲氣看不起人表情
Set-Location 'C:\Users\User\Downloads\Sean windows agent'
& 'C:\Users\User\.libtv\libtv.exe' project use fb44ee1b41344312ab00c8ba07381e78

Write-Host "重拍 V27 v3 傲氣版..."
& 'C:\Users\User\.libtv\libtv.exe' node create 'VOID-V27-Verse2-MaleArrogant' -t video `
  -s 'model=wanxiang-v2-6' -s 'modeType=frames2video' `
  -s 'duration=5' -s 'resolution=1080P' -s 'multiClip=1' `
  --left '1a29ca2b-5bda-4a35-8476-069a80a51dde' `
  --prompt 'Korean male model medium shot half body, chin slightly raised, eyes looking downward with cold arrogant disdain, slight contemptuous smirk at corner of mouth, cold blue atmospheric light from above, dark abandoned stone wall background, low ground mist, slow subtle camera push up from below emphasizing dominance, cinematic dark charisma' `
  --run 2>&1

Write-Host "V27 v3 done"
