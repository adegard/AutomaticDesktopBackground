if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-windowstyle hidden -NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

$keyword="fantasy"
iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/adegard/AutomaticDesktopBackground/main/PersonalizedWallpaper.ps1'))