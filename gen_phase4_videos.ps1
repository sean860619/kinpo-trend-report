# Phase 4 - 場景影片 V17-V24（從 Phase 3 場景圖轉影片）
# 模型：Wan 2.6 frames2video，5秒，1080P
Set-Location 'C:\Users\User\Downloads\Sean windows agent'
& 'C:\Users\User\.libtv\libtv.exe' project use fb44ee1b41344312ab00c8ba07381e78

# V17 - 廢棄教堂光束（Church-LightRay）
Write-Host "生成 V17 廢棄教堂光束..."
& 'C:\Users\User\.libtv\libtv.exe' node create 'VOID-V17-Church-LightRay' -t video `
  -s 'model=wanxiang-v2-6' -s 'modeType=frames2video' `
  -s 'duration=5' -s 'resolution=1080P' -s 'multiClip=1' `
  --left 'c7902480-a71c-4e72-be68-91581813f1b4' `
  --prompt 'Slow dolly push forward into abandoned gothic cathedral, cold blue light beams shifting through broken rose window, dust motes floating in rays, low ground mist drifting slowly across stone floor, dark atmospheric environment, smooth cinematic camera movement' `
  --run 2>&1

# V18 - 教堂石階枯玫瑰（Church-Detail）
Write-Host "生成 V18 教堂石階枯玫瑰..."
& 'C:\Users\User\.libtv\libtv.exe' node create 'VOID-V18-Church-Detail' -t video `
  -s 'model=wanxiang-v2-6' -s 'modeType=frames2video' `
  -s 'duration=5' -s 'resolution=1080P' -s 'multiClip=1' `
  --left '12163465-71e5-4662-9ea6-7342fa1b98d7' `
  --prompt 'Slow pan down weathered stone stairs, withered rose petals trembling faintly in still air, melted candle wax texture, rain water seeping through stone cracks, dim amber and cold blue ambient light, melancholic gothic atmosphere, smooth gentle camera movement' `
  --run 2>&1

# V19 - 地下通道遠景（Tunnel-Wide）
Write-Host "生成 V19 地下通道遠景..."
& 'C:\Users\User\.libtv\libtv.exe' node create 'VOID-V19-Tunnel-Wide' -t video `
  -s 'model=wanxiang-v2-6' -s 'modeType=frames2video' `
  -s 'duration=5' -s 'resolution=1080P' -s 'multiClip=1' `
  --left '72281862-28db-4dd7-9af0-05b499a73e17' `
  --prompt 'Slow steady dolly forward through underground tunnel corridor, neon blue tube lights flickering subtly on wet ceiling, floor reflections shimmering with each flicker, thin mist drifting through air, vanishing point receding into darkness, atmospheric cinematic push' `
  --run 2>&1

# V20 - 地下通道側牆（Tunnel-Wall）
Write-Host "生成 V20 地下通道側牆..."
& 'C:\Users\User\.libtv\libtv.exe' node create 'VOID-V20-Tunnel-Wall' -t video `
  -s 'model=wanxiang-v2-6' -s 'modeType=frames2video' `
  -s 'duration=5' -s 'resolution=1080P' -s 'multiClip=1' `
  --left 'b5fdf83a-f118-4f48-a6f6-52ed6ab3b562' `
  --prompt 'Slow tilt up along dark concrete wall, water droplets slowly sliding down surface, neon blue light pulsing gently on puddle below, water stain textures on weathered concrete, quiet abandoned underground atmosphere, smooth cinematic tilt movement' `
  --run 2>&1

# V21 - 碎鏡散落（Mirror-Scatter）
Write-Host "生成 V21 碎鏡散落..."
& 'C:\Users\User\.libtv\libtv.exe' node create 'VOID-V21-Mirror-Scatter' -t video `
  -s 'model=wanxiang-v2-6' -s 'modeType=frames2video' `
  -s 'duration=5' -s 'resolution=1080P' -s 'multiClip=1' `
  --left '7c1fd587-aa7b-40d9-a8bb-6febd2585856' `
  --prompt 'Gentle slow zoom out from broken mirror shards on dark floor, cold blue-purple light slowly shifting across sharp glass edges, reflections catching and releasing light naturally, glass surface refracting light beams, abstract dark void environment, smooth cinematic movement' `
  --run 2>&1

# V22 - 碎玻璃特寫（Mirror-Close）
Write-Host "生成 V22 碎玻璃特寫..."
& 'C:\Users\User\.libtv\libtv.exe' node create 'VOID-V22-Mirror-Close' -t video `
  -s 'model=wanxiang-v2-6' -s 'modeType=frames2video' `
  -s 'duration=5' -s 'resolution=1080P' -s 'multiClip=1' `
  --left '6bffe654-2495-471f-93ac-1b6bd8b68dd7' `
  --prompt 'Extreme macro close up of shattered glass fragments, cold blue light slowly shifting across razor sharp glass edges, natural light refracting through geometric glass facets, very subtle camera micro movement, dark void background, hyperrealistic glass texture' `
  --run 2>&1

# V23 - 破碎玻璃疊加女主角（GlassFace-Female）
Write-Host "生成 V23 破碎疊加女主角..."
& 'C:\Users\User\.libtv\libtv.exe' node create 'VOID-V23-GlassFace-Female' -t video `
  -s 'model=wanxiang-v2-6' -s 'modeType=frames2video' `
  -s 'duration=5' -s 'resolution=1080P' -s 'multiClip=1' `
  --left '17235391-818e-4f2f-ba88-ad3d9f3b8ee1' `
  --prompt 'Slow gentle zoom in toward face, torn paper fragments settling slowly under their own weight, one eye becoming sharply clear through a gap in the composition, paper edges moving like breathing, high contrast black and white, cold directional light, emotional dark fashion editorial' `
  --run 2>&1

# V24 - 破碎玻璃疊加男主角（GlassFace-Male）
Write-Host "生成 V24 破碎疊加男主角..."
& 'C:\Users\User\.libtv\libtv.exe' node create 'VOID-V24-GlassFace-Male' -t video `
  -s 'model=wanxiang-v2-6' -s 'modeType=frames2video' `
  -s 'duration=5' -s 'resolution=1080P' -s 'multiClip=1' `
  --left '5b03b46f-eaeb-4f23-96a9-84ea07ea4960' `
  --prompt 'Slow steady push in toward male face, dark glass shard edges catching cold blue light, intense gaze visible through gap in fragments, cold light gradually intensifying, natural subtle glass surface movement, dark moody editorial atmosphere' `
  --run 2>&1

Write-Host "Phase 4 全部 8 段影片生成完成！"
