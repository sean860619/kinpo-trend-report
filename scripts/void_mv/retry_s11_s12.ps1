# 重試 S11/S12 - 改用純文生圖，移除角色參考圖
Set-Location 'C:\Users\User\Downloads\Sean windows agent'
& 'C:\Users\User\.libtv\libtv.exe' project use fb44ee1b41344312ab00c8ba07381e78

# S11 - 破碎鏡面場景（純環境，不帶人臉）
Write-Host "重試 S11 破碎鏡面..."
& 'C:\Users\User\.libtv\libtv.exe' node create 'VOID-S11-Mirror-v2' -t image `
  -s 'model=seedream-5' -s 'quality=2K' -s 'count=2' `
  --prompt 'Countless broken mirror shards scattered across dark obsidian floor, each fragment reflecting cold blue-purple neon light at different angles, abstract surreal environment, deep void black background, glass edges catching light sharply, mysterious eerie atmosphere, no people, hyperrealistic macro photography, 8K' `
  --run 2>&1

# S12 - 破碎玻璃特寫（純抽象）
Write-Host "重試 S12 破碎玻璃特寫..."
& 'C:\Users\User\.libtv\libtv.exe' node create 'VOID-S12-Mirror2-v2' -t image `
  -s 'model=seedream-5' -s 'quality=2K' -s 'count=2' `
  --prompt 'Extreme close up of shattered glass fragments on black surface, sharp edges catching cold blue light, abstract fractured reflection patterns, dark void background, geometric chaos of broken pieces, cinematic macro shot, hyperrealistic glass texture detail, no people' `
  --run 2>&1

Write-Host "S11/S12 done"
