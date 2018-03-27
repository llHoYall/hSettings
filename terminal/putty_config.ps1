<###############################################################################
 #	@file			terminal/conemu_config.ps1
 #	@brief		This file configures ConEmu program.
 #	@author		llHoYall <hoya128@gmail.com>
 #	@version	v1.0
 #	@note
 #		- 2018.03.26	Created.
 ##############################################################################>

<# Configure ConEmu ----------------------------------------------------------#>
Write-Host -NoNewline " => Config "
Write-Host -ForegroundColor YELLOW "ConEmu"
If (Get-Command putty -errorAction SilentlyContinue) {
	regedit.exe "$($PSScriptRoot)\putty_sexy.xml"
}
Else {
	Write-Host "    Not installed."
}
