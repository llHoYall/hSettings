<# Registry Configuration ----------------------------------------------------#>
If ([System.Environment]::OSVersion.Version.Major -lt 10) {
	$Screen = [System.Windows.Forms.SystemInformation]::PrimaryMonitorSize
}
Else {
	Add-Type -AssemblyName System.Windows.Forms
	$Screen = [System.Windows.Forms.Screen]::PrimaryScreen.Bounds
}
$Width = $Screen.Width
$Height = $Screen.Height

If ($Width -Eq 1920 -And $Height -Eq 1080) {
	regedit.exe /s powershell_setting_1920_1080.reg
}
ElseIf ($Width -Eq 2560 -And $Height -Eq 1440) {
	regedit.exe /s powershell_setting_2560_1440.reg
}
