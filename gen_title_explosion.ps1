# VOID 標題字卡 - 太空爆裂版動態影片 T02-v2
Set-Location 'C:\Users\User\Downloads\Sean windows agent'
& 'C:\Users\User\.libtv\libtv.exe' project use fb44ee1b41344312ab00c8ba07381e78

# T02-v2 - 太空爆裂 → 再成形
Write-Host "生成 T02-v2 太空爆裂版..."
& 'C:\Users\User\.libtv\libtv.exe' node create 'VOID-T02v2-SpaceExplosion' -t video `
  -s 'model=wanxiang-v2-6' -s 'modeType=frames2video' `
  -s 'duration=5' -s 'resolution=1080P' -s 'multiClip=1' `
  --left '9521481c-95de-4605-9722-afd9adec3ef0' `
  --prompt 'Bold letters V O I D floating weightless in deep space void, sudden violent explosion impact from center, shockwave rippling outward, letters and asteroid rock fragments blasting apart in all directions in zero gravity, deep space black with stardust haze, then gravity reverses, all fragments and letters slowly drift back inward, cold blue light intensifying as V O I D reforms letter by letter, final frame letters locked in place glowing cold blue against star field, cinematic space atmosphere' `
  --run 2>&1

Write-Host "T02-v2 done"
