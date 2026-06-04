# VOID MV - Step 4-6 only (clips already downloaded and encoded)
$ffmpeg = 'C:\Users\User\AppData\Local\Microsoft\WinGet\Packages\Gyan.FFmpeg_Microsoft.Winget.Source_8wekyb3d8bbwe\ffmpeg-8.1.1-full_build\bin\ffmpeg.exe'
$clipsDir = 'C:\Users\User\Downloads\Sean windows agent\VOID_clips'
$encodedDir = 'C:\Users\User\Downloads\Sean windows agent\VOID_clips\encoded'
$concatFile = 'C:\Users\User\Downloads\Sean windows agent\VOID_clips\concat.txt'
$silentPath = 'C:\Users\User\Downloads\Sean windows agent\VOID_clips\VOID_MV_SILENT.mp4'
$musicPath = 'C:\Users\User\Downloads\Sean windows agent\VOID_clips\music.mp3'
$finalOutput = 'C:\Users\User\Downloads\Sean windows agent\VOID_MV_FINAL.mp4'

$names = @(
    "00_title","01_V01","02_V17","03_V06","04_V07","05_V08","06_V09","07_V19",
    "08_V10","09_V11","10_V02","11_V21","12_V03","13_V05","14_V12","15_V22",
    "16_V13","17_V14","18_V04","19_V23","20_V24","21_V15","22_V16","23_V18",
    "24_V25","25_V26","26_V27","27_V20","28_V28","29_V29"
)

# Step 4: concat list WITHOUT BOM
Write-Host "=== STEP 4: Writing concat.txt (no BOM) ==="
$lines = @()
foreach ($n in $names) {
    $lines += "file '$encodedDir\$n.mp4'"
}
$enc = New-Object System.Text.UTF8Encoding $false
[System.IO.File]::WriteAllLines($concatFile, $lines, $enc)
Write-Host "concat.txt written: $($lines.Count) entries"

# Step 5: concat silent video
Write-Host "=== STEP 5: Concatenating ==="
& $ffmpeg -f concat -safe 0 -i $concatFile -c copy $silentPath -y
Write-Host "Silent MV created"

# Step 6: add music, trim to 2:30
Write-Host "=== STEP 6: Adding music + trim to 2:30 ==="
$ffArgs = @("-i",$silentPath,"-i",$musicPath,"-map","0:v","-map","1:a","-t","150","-c:v","copy","-c:a","aac","-b:a","192k",$finalOutput,"-y")
& $ffmpeg @ffArgs
Write-Host "=== DONE: $finalOutput ==="
