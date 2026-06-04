# 取 V07/V09/V12/V14/V16 的影片 URL
$ids = @(
  @{name='V07';id='52742032-2e13-4538-8468-91f5241c1957'},
  @{name='V09';id='a0f810c2-385f-49aa-9c8c-07ab1cd9dd62'},
  @{name='V12';id='b9dd09ee-5361-47af-b266-00955c96a71c'},
  @{name='V14';id='003ee216-c384-44dc-bb36-d4a7d9669faa'},
  @{name='V16';id='cdcb7c20-c32a-44ec-b802-4dba728f64d6'}
)
foreach ($item in $ids) {
  $r = & 'C:\Users\User\.libtv\libtv.exe' node $item.id 2>&1
  $j = ($r | Where-Object { $_ -match '^\{' }) | ConvertFrom-Json
  Write-Host "$($item.name) [$($j.name)] => $($j.data.url[0])"
}
