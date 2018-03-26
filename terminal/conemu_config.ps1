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
If (Test-Path -Path "C:\Program Files\ConEmu") {
	Remove-Item "C:\Users\HoYa\AppData\Roaming\conemu_sexy.xml"
	cmd /c mklink /H "C:\Users\HoYa\AppData\Roaming\conemu_sexy.xml" "conemu_sexy.xml"
}
Else {
	Write-Host "    Not installed."
}
