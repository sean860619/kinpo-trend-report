# 女主角：時尚雜誌大片感 + 真人寫實，參考原始人臉
Set-Location 'C:\Users\User\Downloads\Sean windows agent'
& 'C:\Users\User\.libtv\libtv.exe' project use fb44ee1b41344312ab00c8ba07381e78

$prompt = "Korean female model, high fashion magazine editorial photography, hyperrealistic real human skin with natural pores and texture, dark dramatic editorial makeup, luxury dark gothic fashion outfit, silver jewelry, dramatic chiaroscuro studio lighting, professional DSLR camera shot, Vogue Korea editorial quality, real person not illustration, cinematic fashion portrait, slender figure, 8K, identical face to reference photo"

& 'C:\Users\User\.libtv\libtv.exe' node create 'VOID-Female-Editorial' -t image `
  -s 'model=nebula-ultra' `
  -s 'modeType=image2image' `
  -s 'quality=2K' `
  -s 'count=4' `
  --left '7fa0869e-364b-4c86-afd2-46185f4dbb86' `
  --prompt $prompt `
  --run
