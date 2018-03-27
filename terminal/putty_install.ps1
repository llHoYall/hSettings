<###############################################################################
 #	@file			terminal/putty_install.ps1
 #	@brief		This file installs putty program.
 #	@author		llHoYall <hoya128@gmail.com>
 #	@version	v1.0
 #	@note
 #		- 2018.03.27	Created.
 ##############################################################################>

<# Install putty -------------------------------------------------------------#>
Write-Host -NoNewline " => Install "
Write-Host -ForegroundColor YELLOW "putty"
If (Get-Command putty -errorAction SilentlyContinue) {
	Write-Host "    Already installed."
}
Else {
	choco install -y putty
}
