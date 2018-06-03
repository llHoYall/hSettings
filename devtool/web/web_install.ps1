<###############################################################################
 #	@file			devtool/web/web_install.ps1
 #	@brief		This file installs programs for web.
 #	@author		llHoYall <hoya128@gmail.com>
 #	@version	v1.0
 #	@note
 #		- 2018.03.20	Created.
 ##############################################################################>

<# Install NodeJS ------------------------------------------------------------#>
Write-Host -NoNewline " => Install "
Write-Host -ForegroundColor YELLOW "nodejs"
If (Get-Command node -errorAction SilentlyContinue) {
	Write-Host "    Already installed."
} Else {
	choco install -y nodejs
}

<# Install Yarn --------------------------------------------------------------#>
Write-Host -NoNewline " => Install "
Write-Host -ForegroundColor YELLOW "yarn"
If (Get-Command yarn -errorAction SilentlyContinue) {
	Write-Host "    Already installed."
} Else {
	choco install -y yarn
}
