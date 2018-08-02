<###############################################################################
 #	@file			terminal/hyper_install.ps1
 #	@brief		This file installs Hyper program.
 #	@author		llHoYall <hoya128@gmail.com>
 #	@version	v1.0
 #	@note
 #		- 2018.07.08	Created.
 ##############################################################################>

<# Install Hyper -------------------------------------------------------------#>
Write-Host -NoNewline " => Install "
Write-Host -ForegroundColor YELLOW "Hyper"
If (Get-Command hyper -errorAction SilentlyContinue) {
	Write-Host "    Already installed."
}
Else {
	choco install -y hyper
}
