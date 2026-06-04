# VOID 標題字卡 - 太空懸浮版底圖（T01-v2）
Set-Location 'C:\Users\User\Downloads\Sean windows agent'
& 'C:\Users\User\.libtv\libtv.exe' project use fb44ee1b41344312ab00c8ba07381e78

# T01-v2 - 太空懸浮版靜態底圖
Write-Host "生成 T01-v2 太空懸浮版底圖..."
& 'C:\Users\User\.libtv\libtv.exe' node create 'VOID-T01v2-TitleCard-Space' -t image `
  -s 'model=seedream-5' -s 'quality=2K' -s 'count=2' `
  --prompt 'Bold sans-serif title text V O I D floating in deep cosmic void, each letter drifting at a different angle in zero gravity as if shattered apart by impact, deep space black background with faint distant nebula dust haze and sparse star field, cold blue-white light refracting through glass crack lines on each letter surface, sharp shattered glass edges on letter borders, small asteroid rock fragments floating around letters in weightless suspension, no ground no floor, pure deep space environment, cinematic dark hip hop MV title card, high contrast' `
  --run 2>&1

Write-Host "T01-v2 done"
