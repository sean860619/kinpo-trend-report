# Scene 05 - 雙人玻璃隔開，Chorus 高潮
Set-Location 'C:\Users\User\Downloads\Sean windows agent'
& 'C:\Users\User\.libtv\libtv.exe' project use fb44ee1b41344312ab00c8ba07381e78
$prompt = "Korean woman and Korean man separated by glass wall, condensation droplets on glass, woman inside pressing hand against glass, man outside in rain reaching toward glass, cold blue light on woman amber warm light on man, gothic dark fashion, emotional longing expression on both faces, cinematic film still, hyperrealistic, 8K"
& 'C:\Users\User\.libtv\libtv.exe' node create 'VOID-Scene05-TwoChars' -t image `
  -s 'model=seedream-4.5' -s 'modeType=image2image' -s 'quality=2K' -s 'count=2' `
  --left '2e33d1f4-e2e4-45f2-9239-d1560335d220' --left '1a29ca2b-5bda-4a35-8476-069a80a51dde' `
  --prompt $prompt --run
