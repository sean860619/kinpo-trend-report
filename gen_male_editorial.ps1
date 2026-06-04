# 男主角：時尚雜誌大片感 + 真人寫實，參考 v1 節點
Set-Location 'C:\Users\User\Downloads\Sean windows agent'
& 'C:\Users\User\.libtv\libtv.exe' project use fb44ee1b41344312ab00c8ba07381e78

$prompt = "Korean male model, high fashion magazine editorial photography, hyperrealistic real human skin with natural pores and texture, strong natural facial features identical to reference, dark dramatic editorial styling, luxury dark fashion jacket with silver chain details, dramatic studio lighting with shadows, professional DSLR shot, GQ Korea editorial quality, real person not illustration, cinematic fashion portrait, 8K"

& 'C:\Users\User\.libtv\libtv.exe' node create 'VOID-Male-Editorial' -t image `
  -s 'model=nebula-ultra' `
  -s 'modeType=image2image' `
  -s 'quality=2K' `
  -s 'count=4' `
  --left 'f6f0e9e8-37b3-4cf5-b99b-09fc7fa5c55a' `
  --prompt $prompt `
  --run
