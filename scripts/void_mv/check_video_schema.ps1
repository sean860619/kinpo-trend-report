Set-Location 'C:\Users\User\Downloads\Sean windows agent'
$r = & 'C:\Users\User\.libtv\libtv.exe' model MiniMax-Hailuo-2.3 2>&1 | ConvertFrom-Json
$r.schema.properties | ConvertTo-Json -Depth 4
