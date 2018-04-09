<###############################################################################
 #	@file			shell/powershell_config.ps1
 #	@brief		This file configures powershell program.
 #	@author		llHoYall <hoya128@gmail.com>
 #	@version	v1.0
 #	@note
 #		- 2018.04.06	Created.
 ##############################################################################>

<# Configure Powershell ------------------------------------------------------#>
Write-Host -NoNewline " => Config "
Write-Host -ForegroundColor YELLOW "powershell"
If (Get-Command powershell -errorAction SilentlyContinue) {
	Remove-Item $PROFILE
	cmd /c mklink /H $PROFILE "$($PSScriptRoot)\Microsoft.Powershell_profile.ps1"
}
Else {
	Write-Host "    Not installed."
}

<# Registry Configuration ----------------------------------------------------#>
Add-Type -AssemblyName System.Windows.Forms
$Screen = [System.Windows.Forms.Screen]::PrimaryScreen.Bounds
$Width = $Screen.Width
$Height = $Screen.Height

If ($Width -Eq 1920 -And $Height -Eq 1080) {
	regedit.exe "$($PSScriptRoot)\powershell_setting_1920_1080.reg"
}
ElseIf ($Width -Eq 2560 -And $Height -Eq 1440) {
	regedit.exe "$($PSScriptRoot)\powershell_setting_2560_1440.reg"
}
