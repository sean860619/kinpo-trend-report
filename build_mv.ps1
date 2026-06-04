# VOID MV build script
$ffmpeg = 'C:\Users\User\AppData\Local\Microsoft\WinGet\Packages\Gyan.FFmpeg_Microsoft.Winget.Source_8wekyb3d8bbwe\ffmpeg-8.1.1-full_build\bin\ffmpeg.exe'
$clipsDir = 'C:\Users\User\Downloads\Sean windows agent\VOID_clips'
$encodedDir = 'C:\Users\User\Downloads\Sean windows agent\VOID_clips\encoded'
$finalOutput = 'C:\Users\User\Downloads\Sean windows agent\VOID_MV_FINAL.mp4'

New-Item -ItemType Directory -Force -Path $clipsDir | Out-Null
New-Item -ItemType Directory -Force -Path $encodedDir | Out-Null
Write-Host "Folders ready"

# URL list (name=url pairs, in playback order)
$names = @(
    "00_title","01_V01","02_V17","03_V06","04_V07","05_V08","06_V09","07_V19",
    "08_V10","09_V11","10_V02","11_V21","12_V03","13_V05","14_V12","15_V22",
    "16_V13","17_V14","18_V04","19_V23","20_V24","21_V15","22_V16","23_V18",
    "24_V25","25_V26","26_V27","27_V20","28_V28","29_V29"
)
$urls = @(
    "https://libtv-res.liblib.art/sd-gen-save-img/genius_playground/video/a088e7b0de6e4ffdbaabb9d602864978/dfbb48cdfe8380d37e1f4cc51ca9223a1ac25891ef7968f7c23245b49519c5eb.mp4",
    "https://libtv-res.liblib.art/sd-gen-save-img/genius_playground/video/a088e7b0de6e4ffdbaabb9d602864978/ee3b37e239cd1410c2a883d2df6e84dd03bee953b3734f582345038b72e63273.mp4",
    "https://libtv-res.liblib.art/sd-gen-save-img/genius_playground/video/a088e7b0de6e4ffdbaabb9d602864978/d97fb95745f540d366f9494e1b04262880b0270732d152d57a438f7a6ddf4e26.mp4",
    "https://libtv-res.liblib.art/sd-gen-save-img/genius_playground/video/a088e7b0de6e4ffdbaabb9d602864978/a31a731b13a53cc67d4caf2f997e86f127f9c48f46599edff1a64eb29532597a.mp4",
    "https://libtv-res.liblib.art/sd-gen-save-img/genius_playground/video/a088e7b0de6e4ffdbaabb9d602864978/23dfbeaa72855fa4d8b84a9837013aec903ab026d8a11b2261832d251c2c247e.mp4",
    "https://libtv-res.liblib.art/sd-gen-save-img/genius_playground/video/a088e7b0de6e4ffdbaabb9d602864978/cfc10e57d63c41b6d5e11a7fe8bb963d6404e1ce9db5436e676e9740dafb9fd7.mp4",
    "https://libtv-res.liblib.art/sd-gen-save-img/genius_playground/video/a088e7b0de6e4ffdbaabb9d602864978/c8dcc6c5c1208c3a166d54ff83b819c151a33620631152fb42b4c2021b281cfe.mp4",
    "https://libtv-res.liblib.art/sd-gen-save-img/genius_playground/video/a088e7b0de6e4ffdbaabb9d602864978/f8ef57e90c39a60ff5c7eadb8265de92e9eded7dd8c574891b56c32315ac273d.mp4",
    "https://libtv-res.liblib.art/sd-gen-save-img/genius_playground/video/a088e7b0de6e4ffdbaabb9d602864978/c4a7dfbcee0c11fb5b945844be9aebef0084a34d4bf5266e3a6536d354896eb5.mp4",
    "https://libtv-res.liblib.art/sd-gen-save-img/genius_playground/video/a088e7b0de6e4ffdbaabb9d602864978/a0759cfb88177c3b65d17556d2e0b7a2b205f470d924a211be524952fe5fc730.mp4",
    "https://libtv-res.liblib.art/sd-gen-save-img/genius_playground/video/a088e7b0de6e4ffdbaabb9d602864978/f9badca810936d91ae5b0aeb0f4e1d96929cbe08a0fd3f604a3d1c986e38b4bb.mp4",
    "https://libtv-res.liblib.art/sd-gen-save-img/genius_playground/video/a088e7b0de6e4ffdbaabb9d602864978/c6eae54abcda50e581e7f72fa2e5f1a4b4fed1c26a4bc4c90d74e832a521c465.mp4",
    "https://libtv-res.liblib.art/sd-gen-save-img/genius_playground/video/a088e7b0de6e4ffdbaabb9d602864978/b2d59807f9246ed5c8151bd7da72ddd85a3f5d0d97ea3451ab5169a2d154c862.mp4",
    "https://libtv-res.liblib.art/sd-gen-save-img/genius_playground/video/a088e7b0de6e4ffdbaabb9d602864978/fc5c4b7670b59f91f34ec16544dec2a113c7da6c515c2e93f1f840eda67aa9e0.mp4",
    "https://libtv-res.liblib.art/sd-gen-save-img/genius_playground/video/a088e7b0de6e4ffdbaabb9d602864978/d6c18cf14095a3ed4b2fe700e05babafa60eaeceb43c6bade6ae343e4445853f.mp4",
    "https://libtv-res.liblib.art/sd-gen-save-img/genius_playground/video/a088e7b0de6e4ffdbaabb9d602864978/17815e6c6221d498326d9c21e4ea4ede9baecc7f6a08335ec18d15c50f0f2268.mp4",
    "https://libtv-res.liblib.art/sd-gen-save-img/genius_playground/video/a088e7b0de6e4ffdbaabb9d602864978/915ccdf2d6f7572a2c65a37a2a12bfd8d5f9a9d57a315f44a204d80c0562fc78.mp4",
    "https://libtv-res.liblib.art/sd-gen-save-img/genius_playground/video/a088e7b0de6e4ffdbaabb9d602864978/3c0627a75853c96389f4d5b0492f3075f1784b276273ee148483e3f9f07f4504.mp4",
    "https://libtv-res.liblib.art/sd-gen-save-img/genius_playground/video/a088e7b0de6e4ffdbaabb9d602864978/c07ad3344425f9a15424e66bd209f15e02ed65b9a3bb347904aaa2778ee0ffc8.mp4",
    "https://libtv-res.liblib.art/sd-gen-save-img/genius_playground/video/a088e7b0de6e4ffdbaabb9d602864978/173c9599aa66825350e164102a6506ba92d6af172c9b6a60db538875f6278cfd.mp4",
    "https://libtv-res.liblib.art/sd-gen-save-img/genius_playground/video/a088e7b0de6e4ffdbaabb9d602864978/25891801a61115651f8bcf22043907c4a5394c171ad0c556c245d339391b968c.mp4",
    "https://libtv-res.liblib.art/sd-gen-save-img/genius_playground/video/a088e7b0de6e4ffdbaabb9d602864978/b8b883baee82edaeb3e7f6f1ec753ebf5bec613ba5c0603f407fce2188e91dbe.mp4",
    "https://libtv-res.liblib.art/sd-gen-save-img/genius_playground/video/a088e7b0de6e4ffdbaabb9d602864978/7ab9738ce3b90db6a33b63271ebc1278799b6f61ef1897b34e1a6600709cb880.mp4",
    "https://libtv-res.liblib.art/sd-gen-save-img/genius_playground/video/a088e7b0de6e4ffdbaabb9d602864978/f62c939868749103cd32ab4011467b9b4bf4fb3acbf56147344a17a990f0620c.mp4",
    "https://libtv-res.liblib.art/sd-gen-save-img/genius_playground/video/a088e7b0de6e4ffdbaabb9d602864978/f703a24502da8b9b543dcacec9b8530ff0b410054f1795480b0e95acc42a9170.mp4",
    "https://libtv-res.liblib.art/sd-gen-save-img/genius_playground/video/a088e7b0de6e4ffdbaabb9d602864978/ab25aa1f0da683512967281c64722522262039cdfdc507708af2a6515ec0a7e7.mp4",
    "https://libtv-res.liblib.art/sd-gen-save-img/genius_playground/video/a088e7b0de6e4ffdbaabb9d602864978/25e706d1abfb4dfe0f48162fd2489eaaebfc1359f746eab0c5a738862d4ab57d.mp4",
    "https://libtv-res.liblib.art/sd-gen-save-img/genius_playground/video/a088e7b0de6e4ffdbaabb9d602864978/3ddff1168ca665055aad552b3d4fae6d5d15f51380260b7600b36dc8954e389a.mp4",
    "https://libtv-res.liblib.art/sd-gen-save-img/genius_playground/video/a088e7b0de6e4ffdbaabb9d602864978/bd48619702e84ec650a56a1b3cada7c3729067393d223c527daeb028ada3555b.mp4",
    "https://libtv-res.liblib.art/sd-gen-save-img/genius_playground/video/a088e7b0de6e4ffdbaabb9d602864978/bee2a2afd40521fe3ddd26988670a41a8608c8d351d5530f16f6584ef7a22a34.mp4"
)
$musicUrl = "https://libtv-res.liblib.art/sd-gen-save-img/genius_playground/audio/a088e7b0de6e4ffdbaabb9d602864978/c1bccfad3164e50083bce44e7acc182815c4df14bd925ce80e7083fa869c2ae9.mp3"

# Step 1: download clips
Write-Host "=== STEP 1: Downloading $($names.Count) clips ==="
for ($i = 0; $i -lt $names.Count; $i++) {
    $dest = "$clipsDir\$($names[$i]).mp4"
    if (Test-Path $dest) {
        Write-Host "[$($i+1)/$($names.Count)] skip: $($names[$i])"
    } else {
        Write-Host "[$($i+1)/$($names.Count)] download: $($names[$i])"
        Invoke-WebRequest -Uri $urls[$i] -OutFile $dest -UseBasicParsing
    }
}

# Step 2: download music
$musicPath = "$clipsDir\music.mp3"
if (-not (Test-Path $musicPath)) {
    Write-Host "=== STEP 2: Downloading music ==="
    Invoke-WebRequest -Uri $musicUrl -OutFile $musicPath -UseBasicParsing
} else {
    Write-Host "=== STEP 2: Music already exists ==="
}

# Step 3: re-encode to unified format
Write-Host "=== STEP 3: Re-encoding clips ==="
for ($i = 0; $i -lt $names.Count; $i++) {
    $src = "$clipsDir\$($names[$i]).mp4"
    $dst = "$encodedDir\$($names[$i]).mp4"
    if (Test-Path $dst) {
        Write-Host "[$($i+1)/$($names.Count)] skip encode: $($names[$i])"
    } else {
        Write-Host "[$($i+1)/$($names.Count)] encode: $($names[$i])"
        & $ffmpeg -i $src -vf "scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2" -c:v libx264 -preset fast -crf 18 -r 24 -an $dst -y 2>&1 | Out-Null
    }
}

# Step 4: write concat list
Write-Host "=== STEP 4: Writing concat list ==="
$concatFile = "$clipsDir\concat.txt"
$concatLines = @()
for ($i = 0; $i -lt $names.Count; $i++) {
    $concatLines += "file '$encodedDir\$($names[$i]).mp4'"
}
$concatLines | Set-Content -Path $concatFile -Encoding UTF8
Write-Host "concat.txt written with $($concatLines.Count) entries"

# Step 5: concat silent video
Write-Host "=== STEP 5: Concatenating clips ==="
$silentPath = "$clipsDir\VOID_MV_SILENT.mp4"
& $ffmpeg -f concat -safe 0 -i $concatFile -c copy $silentPath -y

# Step 6: add music, trim to 2:30
Write-Host "=== STEP 6: Adding music, trimming to 2:30 ==="
$args6 = @("-i",$silentPath,"-i",$musicPath,"-map","0:v","-map","1:a","-t","150","-c:v","copy","-c:a","aac","-b:a","192k",$finalOutput,"-y")
& $ffmpeg @args6

Write-Host "=== DONE: $finalOutput ==="
