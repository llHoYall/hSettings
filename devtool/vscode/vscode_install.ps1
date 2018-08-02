<###############################################################################
 #	@file			devtool/vscode/vscode_install.ps1
 #	@brief		This file installs vscode program.
 #	@author		llHoYall <hoya128@gmail.com>
 #	@version	v1.0
 #	@note
 #		- 2018.08.02	Created.
 ##############################################################################>

<# Install Meld --------------------------------------------------------------#>
Write-Host -NoNewline " => Install "
Write-Host -ForegroundColor YELLOW "vscode"
If (Get-Command code -errorAction SilentlyContinue) {
	Write-Host "    Already installed."
} Else {
	choco install -y vscode
}
