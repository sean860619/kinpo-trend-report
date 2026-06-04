Set-Location 'C:\Users\User\Downloads\Sean windows agent'
$prompt = Get-Content 'void_music_v2_prompt.txt' -Raw -Encoding UTF8
& 'C:\Users\User\.libtv\libtv.exe' node create 'VOID - 音樂 v2 (Mureka)' -t audio -s 'model=mureka-8' -s 'scene=Music' -s 'force_instrumental=0' --prompt $prompt --run
