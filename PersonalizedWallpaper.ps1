# From https://dev.to/stebaker92/randomizing-your-windows-desktop-background-using-powershell-8l5
# Modified by adegard, 2021
# Specify a search term before launching the script, like
# $keyword="nature"

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

$filename = "C:\bg.jpg"

"Downloading $filename"

Invoke-WebRequest $wallUrl -OutFile $filename

# load the Set-Wallpaper module so we can execute it

# https://www.joseespitia.com/2017/09/15/set-wallpaper-powershell-function/
Function Set-WallPaper {
 
<#
 
    .SYNOPSIS
    Applies a specified wallpaper to the current user's desktop
    
    .PARAMETER Image
    Provide the exact path to the image
 
    .PARAMETER Style
    Provide wallpaper style (Example: Fill, Fit, Stretch, Tile, Center, or Span)
  
    .EXAMPLE
    Set-WallPaper -Image "C:\Wallpaper\Default.jpg"
    Set-WallPaper -Image "C:\Wallpaper\Background.jpg" -Style Fit
  
#>
 
param (
    [parameter(Mandatory=$True)]
    # Provide path to image
    [string]$Image,
    # Provide wallpaper style that you would like applied
    [parameter(Mandatory=$False)]
    [ValidateSet('Fill', 'Fit', 'Stretch', 'Tile', 'Center', 'Span')]
    [string]$Style
)
 
$WallpaperStyle = Switch ($Style) {
  
    "Fill" {"10"}
    "Fit" {"6"}
    "Stretch" {"2"}
    "Tile" {"0"}
    "Center" {"0"}
    "Span" {"22"}
  
}
 
If($Style -eq "Tile") {
 
    New-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name WallpaperStyle -PropertyType String -Value $WallpaperStyle -Force
    New-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name TileWallpaper -PropertyType String -Value 1 -Force
 
}
Else {
 
    New-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name WallpaperStyle -PropertyType String -Value $WallpaperStyle -Force
    New-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name TileWallpaper -PropertyType String -Value 0 -Force
 
}
 
Add-Type -TypeDefinition @" 
using System; 
using System.Runtime.InteropServices;
  
public class Params
{ 
    [DllImport("User32.dll",CharSet=CharSet.Unicode)] 
    public static extern int SystemParametersInfo (Int32 uAction, 
                                                   Int32 uParam, 
                                                   String lpvParam, 
                                                   Int32 fuWinIni);
}
"@ 
  
    $SPI_SETDESKWALLPAPER = 0x0014
    $UpdateIniFile = 0x01
    $SendChangeEvent = 0x02
  
    $fWinIni = $UpdateIniFile -bor $SendChangeEvent
  
    $ret = [Params]::SystemParametersInfo($SPI_SETDESKWALLPAPER, 0, $Image, $fWinIni)
}
 
 Set-Wallpaper -Image $filename  -Style Fill

# To debug any issues, uncomment the following line:
# pause

