# Получаем данные с API и сохраняем их в переменную
$response = Invoke-WebRequest -Uri 'https://www.radiorecord.ru/api/stations' -ContentType "application/json" -Method Get -UseBasicParsing

# Преобразуем содержимое ответа из JSON
$json = $response.Content | ConvertFrom-Json

# Извлекаем плейлисты
$playlists = $json.result.stations.stream_320

# Записываем плейлисты в файл
$playlists | Out-File -FilePath "$PSScriptRoot\RadioRecord.m3u" -Encoding UTF8
