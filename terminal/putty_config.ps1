<###############################################################################
 #	@file			terminal/putty_config.ps1
 #	@brief		This file configures putty program.
 #	@author		llHoYall <hoya128@gmail.com>
 #	@version	v1.0
 #	@note
 #		- 2018.03.26	Created.
 ##############################################################################>

<# Configure ConEmu ----------------------------------------------------------#>
Write-Host -NoNewline " => Config "
Write-Host -ForegroundColor YELLOW "putty"
If (Get-Command putty -errorAction SilentlyContinue) {
	regedit.exe "$($PSScriptRoot)\putty_sexy.reg"
}
Else {
	Write-Host "    Not installed."
}
