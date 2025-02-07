# PowerShell -ExecutionPolicy Bypass -WindowStyle Hidden -Command "Out-Null"

$TargetPath     = "C:\ProgramData\Intel\Audio"
$TargetFile     = "$TargetPath\AudioTools.exe"
$TargetGrabber  = "$TargetPath\Notify.exe"
$TargetSchedule = "$TargetPath\Schedule.exe"
$TargetSystem   = "$env:APPDATA\Microsoft\Windows\StartMenu\Programs\Startup\System.exe"

Remove-MpPreference -ExclusionProcess 'AudioTools.exe' -Force
Remove-MpPreference -ExclusionProcess 'Notify.exe' -Force
Remove-MpPreference -ExclusionProcess 'Schedule.bat' -Force
Remove-MpPreference -ExclusionProcess 'System.exe' -Force
Remove-MpPreference -ExclusionPath "$TargetPath" -Force
Remove-MpPreference -ExclusionPath "$TargetFile" -Force
Remove-MpPreference -ExclusionPath "$TargetGrabber" -Force
Remove-MpPreference -ExclusionPath "$TargetSchedule" -Force
Remove-MpPreference -ExclusionPath "$TargetSystem" -Force

if (Get-Process -Name "AudioTools" -ErrorAction SilentlyContinue) {
  $ProcID = (Get-Process -Name "AudioTools").Id
  Stop-Process -Id $ProcID -Force
  Start-Sleep -Seconds 2
}

if (Test-Path "$TargetPath") {
  Remove-Item -Recurse -Force -Path "$TargetPath"
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