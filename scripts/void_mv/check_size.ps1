# 檢查三個資料夾大小
$p1 = (Get-ChildItem 'C:\Users\User\Downloads\Sean windows agent' -Recurse -ErrorAction SilentlyContinue | Measure-Object -Property Length -Sum).Sum
$p2 = (Get-ChildItem 'C:\Users\User\.claude' -Recurse -ErrorAction SilentlyContinue | Measure-Object -Property Length -Sum).Sum
$p3 = (Get-ChildItem 'C:\Users\User\.libtv' -Recurse -ErrorAction SilentlyContinue | Measure-Object -Property Length -Sum).Sum
$total = $p1 + $p2 + $p3
Write-Host "Sean windows agent: $([math]::Round($p1/1MB, 1)) MB"
Write-Host ".claude:            $([math]::Round($p2/1MB, 1)) MB"
Write-Host ".libtv:             $([math]::Round($p3/1MB, 1)) MB"
Write-Host "Total:              $([math]::Round($total/1MB, 1)) MB"
