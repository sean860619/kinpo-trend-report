# Scene 06 - 男主角雨中，決意凝視
Set-Location 'C:\Users\User\Downloads\Sean windows agent'
& 'C:\Users\User\.libtv\libtv.exe' project use fb44ee1b41344312ab00c8ba07381e78
$prompt = "Korean male model face and upper body, dark urban alley at night, heavy rain falling, wet face with water droplets on skin, intense determined gaze forward, dark leather jacket with silver chain details, neon light reflections on wet street below, cold cinematic color grading, hyperrealistic, 8K, identical face to reference"
& 'C:\Users\User\.libtv\libtv.exe' node create 'VOID-Scene06-MaleRain' -t image `
  -s 'model=nebula-ultra' -s 'modeType=image2image' -s 'quality=2K' -s 'count=2' `
  --left '1a29ca2b-5bda-4a35-8476-069a80a51dde' --prompt $prompt --run
