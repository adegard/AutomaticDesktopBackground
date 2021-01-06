if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/adegard/AutomaticDesktopBackground/main/NewDesktopImage.ps1'))
