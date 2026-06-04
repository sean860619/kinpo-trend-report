# Scene 02 - 女主角臉部特寫 B：側光煙霧，迷離
Set-Location 'C:\Users\User\Downloads\Sean windows agent'
& 'C:\Users\User\.libtv\libtv.exe' project use fb44ee1b41344312ab00c8ba07381e78
$prompt = "close up portrait of Korean female model, dramatic side lighting from left, thin smoke wisps floating, melancholic empty gaze into distance, dark tear streak, gothic lace necklace, silver cross jewelry, cold shadow contrast, moody cinematic atmosphere, hyperrealistic, 8K, identical face to reference"
& 'C:\Users\User\.libtv\libtv.exe' node create 'VOID-Scene02-FaceB' -t image `
  -s 'model=nebula-ultra' -s 'modeType=image2image' -s 'quality=2K' -s 'count=2' `
  --left '2e33d1f4-e2e4-45f2-9239-d1560335d220' --prompt $prompt --run
