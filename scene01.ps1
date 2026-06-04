# Scene 01 - 女主角臉部特寫 A：冷藍光，空洞仰視
Set-Location 'C:\Users\User\Downloads\Sean windows agent'
& 'C:\Users\User\.libtv\libtv.exe' project use fb44ee1b41344312ab00c8ba07381e78
$prompt = "extreme close up face shot of Korean female model, cold blue neon light from below, hollow distant upward gaze, smooth porcelain skin with natural texture, dark heavy eyeshadow, gothic silver cross earrings, velvet collar, dark moody background, tears on cheek, cinematic lighting, hyperrealistic, 8K, identical face to reference"
& 'C:\Users\User\.libtv\libtv.exe' node create 'VOID-Scene01-FaceA' -t image `
  -s 'model=nebula-ultra' -s 'modeType=image2image' -s 'quality=2K' -s 'count=2' `
  --left '2e33d1f4-e2e4-45f2-9239-d1560335d220' --prompt $prompt --run
