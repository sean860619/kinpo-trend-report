# 下載確認的女主角第2張、男主角第2張，上傳後跑三視圖
Set-Location 'C:\Users\User\Downloads\Sean windows agent'
& 'C:\Users\User\.libtv\libtv.exe' project use fb44ee1b41344312ab00c8ba07381e78

# 下載兩張確認圖片到本地
Write-Host "下載女主角確認圖..."
Invoke-WebRequest -Uri "https://libtv-res.liblib.art/sd-gen-save-img/genius_playground/image/a088e7b0de6e4ffdbaabb9d602864978/747945615_b05f3b4490cf4dc6b4ac3c004a193ce9.png" -OutFile "female_confirmed.png"

Write-Host "下載男主角確認圖..."
Invoke-WebRequest -Uri "https://libtv-res.liblib.art/sd-gen-save-img/genius_playground/image/a088e7b0de6e4ffdbaabb9d602864978/747947887_a1898d1c967a49708569aa421837cf58.png" -OutFile "male_confirmed.png"

# 上傳女主角確認圖
Write-Host "上傳女主角..."
$femaleUpload = & 'C:\Users\User\.libtv\libtv.exe' upload 'VOID-Female-Final' -f 'female_confirmed.png' -t image 2>&1
Write-Host $femaleUpload
$femaleNode = ($femaleUpload | ConvertFrom-Json).nodeKey
Write-Host "女主角節點 ID: $femaleNode"

# 上傳男主角確認圖
Write-Host "上傳男主角..."
$maleUpload = & 'C:\Users\User\.libtv\libtv.exe' upload 'VOID-Male-Final' -f 'male_confirmed.png' -t image 2>&1
Write-Host $maleUpload
$maleNode = ($maleUpload | ConvertFrom-Json).nodeKey
Write-Host "男主角節點 ID: $maleNode"

# 跑女主角三視圖
Write-Host "生成女主角三視圖..."
& 'C:\Users\User\.libtv\libtv.exe' image shortcut character_turnaround_3view -n $femaleNode 2>&1

# 跑男主角三視圖
Write-Host "生成男主角三視圖..."
& 'C:\Users\User\.libtv\libtv.exe' image shortcut character_turnaround_3view -n $maleNode 2>&1
