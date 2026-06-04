$RCLONE = "C:\Users\User\AppData\Local\Microsoft\WinGet\Packages\Rclone.Rclone_Microsoft.Winget.Source_8wekyb3d8bbwe\rclone-v1.74.2-windows-amd64\rclone.exe"
$SOURCE = "C:\Users\User\Downloads\Sean windows agent"
$DEST   = "gdrive:Sean-windows-agent"

& $RCLONE sync $SOURCE $DEST `
    --filter "+ *.md" `
    --filter "+ *.ps1" `
    --filter "- *" `
    --transfers 4 `
    --progress
