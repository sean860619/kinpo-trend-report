# Scene 04 - 女主角全身，廢墟藍光，Bridge
Set-Location 'C:\Users\User\Downloads\Sean windows agent'
& 'C:\Users\User\.libtv\libtv.exe' project use fb44ee1b41344312ab00c8ba07381e78
$prompt = "Korean female model full body, standing alone in dark abandoned concrete space, dramatic blue light shafts from above, cracked floor with thin fog, gothic black dress with silver accessories, back slightly turned looking over shoulder, lonely silhouette, cinematic wideshot, hyperrealistic, 8K"
& 'C:\Users\User\.libtv\libtv.exe' node create 'VOID-Scene04-FullBody' -t image `
  -s 'model=mj-v7' -s 'modeType=image2image' -s 'count=4' `
  --left '2e33d1f4-e2e4-45f2-9239-d1560335d220' --prompt $prompt --run
