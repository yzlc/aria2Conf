Write-Host "copy aria2 conf..."
$aria2Dir = "$(appdir aria2)\current"
cp -Recurse -Force ./* $aria2Dir

Write-Host "add aria2 boot..."
cd $aria2Dir\bin
$Shell = New-Object -ComObject ("WScript.Shell")
$Shortcut = $Shell.CreateShortcut($env:APPDATA + "/Microsoft/Windows/Start Menu/Programs/StartUp/aria2.lnk")
$Shortcut.TargetPath = "$aria2Dir\bin\aria2.vbs"
$Shortcut.WorkingDirectory = "$aria2Dir\bin"
$Shortcut.Save()

Write-Host "aria2 run..."
#.\kill.bat
wscript.exe "aria2.vbs"