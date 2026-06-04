# VOID 標題字卡 - 超強爆裂版 T02-v3（直衝鏡頭）
Set-Location 'C:\Users\User\Downloads\Sean windows agent'
& 'C:\Users\User\.libtv\libtv.exe' project use fb44ee1b41344312ab00c8ba07381e78

# T02-v3 - 極端 POV 爆裂 → 再成形
Write-Host "生成 T02-v3 超強爆裂版..."
& 'C:\Users\User\.libtv\libtv.exe' node create 'VOID-T02v3-SpaceExplosion-POV' -t video `
  -s 'model=wanxiang-v2-6' -s 'modeType=frames2video' `
  -s 'duration=5' -s 'resolution=1080P' -s 'multiClip=1' `
  --left '9521481c-95de-4605-9722-afd9adec3ef0' `
  --prompt 'Extreme close POV camera facing VOID letters suspended in deep space, massive detonation explodes from inside the letters directly toward camera, concrete stone debris and shattered rock chunks blasting at full force toward the lens, shockwave expanding outward filling the frame, dust and rock cloud engulfing camera, raw physical impact force, then all fragments reverse in zero gravity and slam back together violently, V O I D letters reforming with brutal force, cold blue light flaring on impact as letters lock, deep space star field behind, photorealistic visceral explosion, no soft glow' `
  --run 2>&1

Write-Host "T02-v3 done"
