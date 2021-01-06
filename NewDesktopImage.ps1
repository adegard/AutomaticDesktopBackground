# From https://dev.to/stebaker92/randomizing-your-windows-desktop-background-using-powershell-8l5
# Modified by adegard, 2021
# Specify a search term or leave it blank:
# $keyword=$null
$keyword="landscape"

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$url = "https://wallhaven.cc/api/v1/search?sorting=random&q=${keyword}";

# See full list of options here:
# https://wallhaven.cc/help/api#search

"Loading results from: $url"

$response = Invoke-RestMethod -Uri $url

# Filter out landscape results
$response.data = $response.data | Where { $_.dimension_y -le $_.dimension_x }

$count = $response.data.length -1
"Found $count images"

$random = Get-Random -Minimum 0 -Maximum $count
"Random id: $random"

$wallUrl = $response.data[$random].path

$filename = "C:\temp\bg.jpg"

"Downloading $filename"

Invoke-WebRequest $wallUrl -OutFile $filename

# load the Set-Wallpaper module so we can execute it
. $PSScriptRoot/Set-Wallpaper.ps1

Set-Wallpaper -Image $filename

# To debug any issues, uncomment the following line:
# pause