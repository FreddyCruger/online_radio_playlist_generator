Invoke-WebRequest -Uri 'https://www.radiorecord.ru/api/stations' -ContentType "application/json" -Method Get -UseBasicParsing -OutFile data.json
$json = Get-Content -Raw -Path "$PSScriptRoot\data.json" | ConvertFrom-Json
$nums = $json.result.stations
$playlists = $json.result.stations.stream_320
$playlists.foreach({$json.result.stations.stream_320 | Out-File $PSScriptRoot\RadioRecord.m3u})