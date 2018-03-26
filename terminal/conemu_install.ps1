<###############################################################################
 #	@file			terminal/conemu_install.ps1
 #	@brief		This file installs ConEmu program.
 #	@author		llHoYall <hoya128@gmail.com>
 #	@version	v1.0
 #	@note
 #		- 2018.03.26	Created.
 ##############################################################################>

<# Install ConEmu ------------------------------------------------------------#>
Write-Host -NoNewline " => Install "
Write-Host -ForegroundColor YELLOW "ConEmu"
If (Test-Path -Path "C:\Program Files\ConEmu") {
	Write-Host "    Already installed."
}
Else {
	choco install -y conemu
}
