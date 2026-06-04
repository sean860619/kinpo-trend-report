# VOID 標題字卡 - 靜態圖
Set-Location 'C:\Users\User\Downloads\Sean windows agent'
& 'C:\Users\User\.libtv\libtv.exe' project use fb44ee1b41344312ab00c8ba07381e78

# T01 - VOID 標題字卡靜態圖（Seedream 5.0，碎裂玻璃風格）
Write-Host "生成 VOID 標題字卡靜態圖..."
& 'C:\Users\User\.libtv\libtv.exe' node create 'VOID-T01-TitleCard-Static' -t image `
  -s 'model=seedream-5' -s 'quality=2K' -s 'count=2' `
  --prompt 'Bold sans-serif title text V O I D with wide letter spacing, each letter positioned at slightly different angle as if shattered apart by impact, deep glass crack lines running through each letter surface, cold blue-white light refracting through crack lines, sharp glass shard edges on letter borders, letters scattered irregularly like broken mirror pieces, pure deep black void background, no other elements, cinematic title card typography, dark Korean hip hop MV aesthetic, high contrast' `
  --run 2>&1

Write-Host "T01 done"
