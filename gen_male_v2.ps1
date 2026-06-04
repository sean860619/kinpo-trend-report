# 男主角 v2：寫實風格，以 v1 節點為臉部基準，移除哥特誇張元素
Set-Location 'C:\Users\User\Downloads\Sean windows agent'
& 'C:\Users\User\.libtv\libtv.exe' project use fb44ee1b41344312ab00c8ba07381e78

$prompt = "Korean male, hyper realistic photographic portrait, natural real skin texture with visible pores, real human face identical to reference, dark natural eyes, strong jawline, authentic everyday appearance, dark casual jacket, minimal accessories, natural cinematic film lighting, photorealistic, no fantasy no gothic no exaggeration, real person style, film still quality, 8K detail"

& 'C:\Users\User\.libtv\libtv.exe' node create 'VOID-Male-v2-Realistic' -t image `
  -s 'model=nebula-ultra' `
  -s 'modeType=image2image' `
  -s 'quality=2K' `
  -s 'count=4' `
  --left 'f6f0e9e8-37b3-4cf5-b99b-09fc7fa5c55a' `
  --prompt $prompt `
  --run
