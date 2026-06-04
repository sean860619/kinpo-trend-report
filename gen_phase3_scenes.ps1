# Phase 3 - 新場景底圖 × 6 + 破碎玻璃疊加圖 × 2（Seedream 5.0）
Set-Location 'C:\Users\User\Downloads\Sean windows agent'
& 'C:\Users\User\.libtv\libtv.exe' project use fb44ee1b41344312ab00c8ba07381e78

# S07 - 廢棄教堂大廳
Write-Host "生成 S07 廢棄教堂大廳..."
& 'C:\Users\User\.libtv\libtv.exe' node create 'VOID-S07-Church' -t image `
  -s 'model=seedream-5' -s 'quality=2K' -s 'count=2' `
  --prompt 'Abandoned gothic cathedral interior, massive broken rose window with cold blue light shafts piercing through dust, tall crumbling stone pillars, water puddles on ancient stone floor reflecting light, ground fog rolling low, dark atmospheric, no people, hyperrealistic cinematic environment, 8K' `
  --run 2>&1

# S08 - 教堂近景石階枯玫瑰
Write-Host "生成 S08 教堂近景..."
& 'C:\Users\User\.libtv\libtv.exe' node create 'VOID-S08-Church2' -t image `
  -s 'model=seedream-5' -s 'quality=2K' -s 'count=2' `
  --prompt 'Gothic church interior detail, weathered stone stairs, withered black roses fallen on steps, melted candle wax pooled on stone, rain water seeping through cracks, cold blue and faint amber candlelight, dark gothic atmosphere, no people, hyperrealistic cinematic composition' `
  --run 2>&1

# S09 - 地下通道遠景透視
Write-Host "生成 S09 地下通道遠景..."
& 'C:\Users\User\.libtv\libtv.exe' node create 'VOID-S09-Tunnel' -t image `
  -s 'model=seedream-5' -s 'quality=2K' -s 'count=2' `
  --prompt 'Underground tunnel corridor long perspective, vanishing point into darkness, cold neon blue tube lights along curved walls, accumulated rainwater on wet floor reflecting neon glow, thin mist and rising fog, water dripping from ceiling, dark abandoned atmosphere, no people, cinematic wide shot' `
  --run 2>&1

# S10 - 地下通道側牆近景
Write-Host "生成 S10 地下通道側牆..."
& 'C:\Users\User\.libtv\libtv.exe' node create 'VOID-S10-Tunnel2' -t image `
  -s 'model=seedream-5' -s 'quality=2K' -s 'count=2' `
  --prompt 'Underground passage wall detail, dark concrete with water stains streaking down, neon blue light shimmering on wet puddle floor, cold ambient glow, minimal textures, abandoned melancholic atmosphere, no people, cinematic detail shot' `
  --run 2>&1

# S11 - 破碎鏡面女主角多重倒影
Write-Host "生成 S11 破碎鏡面倒影..."
& 'C:\Users\User\.libtv\libtv.exe' node create 'VOID-S11-Mirror' -t image `
  -s 'model=seedream-5' -s 'modeType=image2image' -s 'quality=2K' -s 'count=2' `
  --left '2e33d1f4-e2e4-45f2-9239-d1560335d220' `
  --prompt 'Korean female model reflected in countless broken mirror shards scattered on dark ground, each glass fragment catching a different angle of her face, cold blue-purple light refracting through glass edges, surreal abstract composition, deep dark void background, shattered glass pieces floating' `
  --run 2>&1

# S12 - 破碎玻璃臉部特寫倒影
Write-Host "生成 S12 破碎玻璃特寫..."
& 'C:\Users\User\.libtv\libtv.exe' node create 'VOID-S12-Mirror2' -t image `
  -s 'model=seedream-5' -s 'modeType=image2image' -s 'quality=2K' -s 'count=2' `
  --left '2e33d1f4-e2e4-45f2-9239-d1560335d220' `
  --prompt 'Extreme close up macro shot of scattered mirror shards on black surface, Korean female face reflected in each fragment at different angle and expression, cold blue light catching sharp glass edges, abstract emotional composition, hyperrealistic glass detail' `
  --run 2>&1

# C01 - 破碎玻璃疊加女主角臉（仿 UnTouchable 封面）
Write-Host "生成 C01 破碎玻璃疊加女主角..."
& 'C:\Users\User\.libtv\libtv.exe' node create 'VOID-C01-GlassFace-Female' -t image `
  -s 'model=seedream-5' -s 'modeType=image2image' -s 'quality=2K' -s 'count=2' `
  --left '2e33d1f4-e2e4-45f2-9239-d1560335d220' `
  --prompt 'Korean female model face portrait, shattered black and white crumpled paper torn fragments overlaid across face like broken glass, high contrast desaturated black and white aesthetic, one eye piercing through crack, raw emotional expression visible through fragments, avant-garde editorial dark fashion art, magazine cover composition' `
  --run 2>&1

# C02 - 破碎玻璃疊加男主角臉
Write-Host "生成 C02 破碎玻璃疊加男主角..."
& 'C:\Users\User\.libtv\libtv.exe' node create 'VOID-C02-GlassFace-Male' -t image `
  -s 'model=seedream-5' -s 'modeType=image2image' -s 'quality=2K' -s 'count=2' `
  --left '1a29ca2b-5bda-4a35-8476-069a80a51dde' `
  --prompt 'Korean male model face portrait, broken dark glass shards overlaid across face, cold blue light remaining visible in intense eyes through fragments, cracked surface pattern across skin, desaturated high contrast, powerful gaze piercing through shattered pieces, editorial dark fashion art' `
  --run 2>&1

Write-Host "Phase 3 全部 8 個場景節點生成完成！"
