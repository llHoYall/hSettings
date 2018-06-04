<###############################################################################
 #	@file			devtool/meld/meld_install.ps1
 #	@brief		This file installs meld program.
 #	@author		llHoYall <hoya128@gmail.com>
 #	@version	v1.0
 #	@note
 #		- 2018.06.04	Created.
 ##############################################################################>

<# Install Meld --------------------------------------------------------------#>
Write-Host -NoNewline " => Install "
Write-Host -ForegroundColor YELLOW "meld"
If (Get-Command meld -errorAction SilentlyContinue) {
	Write-Host "    Already installed."
} Else {
	choco install -y meld
}
