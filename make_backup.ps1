# 壓縮備份腳本，排除 VOID_clips
$dest = 'C:\Users\User\Desktop\claude_backup.zip'
$paths = @()

# Sean windows agent 內的項目，排除 VOID_clips
$items = Get-ChildItem 'C:\Users\User\Downloads\Sean windows agent' | Where-Object { $_.Name -ne 'VOID_clips' }
foreach ($item in $items) {
    $paths += $item.FullName
}

# 加入另外兩個資料夾
$paths += 'C:\Users\User\.claude'
$paths += 'C:\Users\User\.libtv'

Write-Host "壓縮 $($paths.Count) 個項目，請稍候..."
Compress-Archive -Path $paths -DestinationPath $dest -Force
$sizeMB = [math]::Round((Get-Item $dest).Length / 1MB, 1)
Write-Host "完成：$dest ($sizeMB MB)"
