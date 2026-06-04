Set-Location 'C:\Users\User\Downloads\Sean windows agent'
$prompt = Get-Content 'void_music_prompt.txt' -Raw -Encoding UTF8
& 'C:\Users\User\.libtv\libtv.exe' node create 'VOID - 完整歌曲' -t audio -s 'model=vocal-music' -s 'scene=Music' -s 'music_length_ms=120000' --prompt $prompt --run
