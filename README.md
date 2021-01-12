# Automatic Desktop Background (Powershell)
Desktop Automatic new background image (Powershell) 
![](https://github.com/adegard/automaticdesktopbackground/blob/main/sfondo.png?raw=true)
## Nature landscapes wallpaper, using following PowerShell Script:
```
iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/adegard/AutomaticDesktopBackground/main/NewDesktopImage.ps1'))
```

## Personalized Wallpaper, using following PowerShell Script:
```
$keyword="fantasy"
iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/adegard/AutomaticDesktopBackground/main/PersonalizedWallpaper.ps1'))
```

# Schedule change at startup with Windows Scheduler
(https://blog.netwrix.com/2018/07/03/how-to-automate-powershell-scripts-with-task-scheduler/)
![](https://github.com/adegard/WinScripts/blob/main/addonstartup.png?raw=true)

# Create a shortcut to change Wallpaper manually

Save this <a href="https://raw.githubusercontent.com/adegard/AutomaticDesktopBackground/master/changeWallpaper.ps1" target="_blank">file</a>, then right click, run with Powershell.


<div style='page-break-after: always'></div>

# Thanks to 
* <a href="https://www.joseespitia.com/2017/09/15/set-wallpaper-powershell-function/" target="_blank">https://www.joseespitia.com/2017/09/15/set-wallpaper-powershell-function/</a>

* <a href="https://dev.to/stebaker92/randomizing-your-windows-desktop-background-using-powershell-8l5" target="_blank">https://dev.to/stebaker92/randomizing-your-windows-desktop-background-using-powershell-8l5</a>
