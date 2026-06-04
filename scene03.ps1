# Scene 03 - 女主角半身，手向外伸，Chorus
Set-Location 'C:\Users\User\Downloads\Sean windows agent'
& 'C:\Users\User\.libtv\libtv.exe' project use fb44ee1b41344312ab00c8ba07381e78
$prompt = "Korean female model half body shot, arms reaching outward desperately toward camera, dramatic chiaroscuro lighting, dark smoke billowing around her, gothic luxury black velvet dress with lace, silver chain jewelry, intense emotional raw expression, dark background, cinematic film still, hyperrealistic, 8K"
& 'C:\Users\User\.libtv\libtv.exe' node create 'VOID-Scene03-HalfBody' -t image `
  -s 'model=mj-v7' -s 'modeType=image2image' -s 'count=4' `
  --left '2e33d1f4-e2e4-45f2-9239-d1560335d220' --prompt $prompt --run
