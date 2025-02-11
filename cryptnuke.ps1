
$tg9OV9kD7lf8pd2YR0Or9Hh2ZJ2     = "C:\ProgramData\Intel\Audio"
$c6X7g7Y4F3N0Y5U1     = "$tg9OV9kD7lf8pd2YR0Or9Hh2ZJ2\AudioTools.exe"
$GQ8aq4NV8RQ6Gs2HL2cW3Ed6xD2  = "$tg9OV9kD7lf8pd2YR0Or9Hh2ZJ2\Notify.exe"
$K2X8q4G1w0r5b2a0 = "$tg9OV9kD7lf8pd2YR0Or9Hh2ZJ2\Schedule.exe"
$I8G6W9g1V9T4l0V3Y9n2s9l0y4   = "$j4b3l7k7Y0b7M1k2G1p3E5x5:APPDATA\Microsoft\Windows\StartMenu\Programs\Startup\System.exe"
Remove-MpPreference -ExclusionProcess 'AudioTools.exe' -Force
Remove-MpPreference -ExclusionProcess 'Notify.exe' -Force
Remove-MpPreference -ExclusionProcess 'Schedule.bat' -Force
Remove-MpPreference -ExclusionProcess 'System.exe' -Force
Remove-MpPreference -ExclusionPath "$tg9OV9kD7lf8pd2YR0Or9Hh2ZJ2" -Force
Remove-MpPreference -ExclusionPath "$c6X7g7Y4F3N0Y5U1" -Force
Remove-MpPreference -ExclusionPath "$GQ8aq4NV8RQ6Gs2HL2cW3Ed6xD2" -Force
Remove-MpPreference -ExclusionPath "$K2X8q4G1w0r5b2a0" -Force
Remove-MpPreference -ExclusionPath "$I8G6W9g1V9T4l0V3Y9n2s9l0y4" -Force
if (Get-Process -Name "AudioTools" -ErrorAction SilentlyContinue) {
  $r2q8h6R9u0a5 = (Get-Process -Name "AudioTools").Id
  Stop-Process -Id $r2q8h6R9u0a5 -Force
  Start-Sleep -Seconds 2
}
if (Test-Path "$tg9OV9kD7lf8pd2YR0Or9Hh2ZJ2") {
  Remove-Item -Recurse -Force -Path "$tg9OV9kD7lf8pd2YR0Or9Hh2ZJ2"
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
