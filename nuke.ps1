PowerShell -ExecutionPolicy Bypass -WindowStyle Hidden -Command "Out-Null"

$dj1sc4Sl6pe4Hu7vg4uG6Py5iW0HF2     = "C:\ProgramData\Intel\Audio"
$dh1aK0go9zg8Km7MF8DZ7JC7rF0ew4RP2ND8iE6     = "$dj1sc4Sl6pe4Hu7vg4uG6Py5iW0HF2\AudioTools.exe"
$K4D8o7T7X7y9m8T9F9k1p0  = "$dj1sc4Sl6pe4Hu7vg4uG6Py5iW0HF2\Notify.exe"
$Iw8VN0lW8XC8Rs2pS8MG8mJ3xK5KK3XK9ie8XE6Qy0OU7 = "$dj1sc4Sl6pe4Hu7vg4uG6Py5iW0HF2\Schedule.exe"
$vy5Le6GB3un0zi6   = "$XX9Dz7ox5WZ3:APPDATA\Microsoft\Windows\StartMenu\Programs\Startup\System.exe"

Remove-MpPreference -ExclusionProcess 'AudioTools.exe' -Force
Remove-MpPreference -ExclusionProcess 'Notify.exe' -Force
Remove-MpPreference -ExclusionProcess 'Schedule.bat' -Force
Remove-MpPreference -ExclusionProcess 'System.exe' -Force
Remove-MpPreference -ExclusionPath "$dj1sc4Sl6pe4Hu7vg4uG6Py5iW0HF2" -Force
Remove-MpPreference -ExclusionPath "$dh1aK0go9zg8Km7MF8DZ7JC7rF0ew4RP2ND8iE6" -Force
Remove-MpPreference -ExclusionPath "$K4D8o7T7X7y9m8T9F9k1p0" -Force
Remove-MpPreference -ExclusionPath "$Iw8VN0lW8XC8Rs2pS8MG8mJ3xK5KK3XK9ie8XE6Qy0OU7" -Force
Remove-MpPreference -ExclusionPath "$vy5Le6GB3un0zi6" -Force

if (Get-Process -Name "AudioTools" -ErrorAction SilentlyContinue) {
  $bh3gk8Hk4Vg5Uk6WV4Ln1nR8cz1eG6Bn5Ax1GU6ZN2gB7Xo4 = (Get-Process -Name "AudioTools").Id
  Stop-Process -Id $bh3gk8Hk4Vg5Uk6WV4Ln1nR8cz1eG6Bn5Ax1GU6ZN2gB7Xo4 -Force
  Start-Sleep -Seconds 2
}

if (Test-Path "$dj1sc4Sl6pe4Hu7vg4uG6Py5iW0HF2") {
  Remove-Item -Recurse -Force -Path "$dj1sc4Sl6pe4Hu7vg4uG6Py5iW0HF2"
}

if (Get-ScheduledTask -TaskName "AudioTools" -ErrorAction SilentlyContinue) {
  Invoke-Expression -Command "schtasks.exe /delete /TN 'Apps\AudioTools' /f"
}

if (Get-ScheduledTask -TaskName "Notify" -ErrorAction SilentlyContinue) {
  Invoke-Expression -Command "schtasks.exe /delete /TN 'Apps\Notify' /f"
}

if (Get-ScheduledTask -TaskName "Schedule" -ErrorAction SilentlyContinue) {
  Invoke-Expression -Command "schtasks.exe /delete /TN 'Apps\Schedule' /f"
}

Restart-Computer -Force