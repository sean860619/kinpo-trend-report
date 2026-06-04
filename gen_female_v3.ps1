# 女主角 v3：暗黑哥特 v1 風格 + 纖細身形，以原始參考圖為臉部基準
Set-Location 'C:\Users\User\Downloads\Sean windows agent'
& 'C:\Users\User\.libtv\libtv.exe' project use fb44ee1b41344312ab00c8ba07381e78

$prompt = "Korean female artist, dark gothic aesthetic, extremely slender slim petite body, very slim waist, lean delicate figure, pale porcelain skin, dark intense eyes with heavy smoky eyeshadow, sharp striking facial features identical to reference, dark luxury gothic streetwear, silver chain accessories, cold blue moody dramatic lighting, gothic elegance, cinematic portrait, ultra detailed, 8K, must preserve exact face shape eyes nose lips from reference photo"

& 'C:\Users\User\.libtv\libtv.exe' node create 'VOID-Female-v3-GothicSlim' -t image `
  -s 'model=nebula-ultra' `
  -s 'modeType=image2image' `
  -s 'quality=2K' `
  -s 'count=4' `
  --left '7fa0869e-364b-4c86-afd2-46185f4dbb86' `
  --prompt $prompt `
  --run
