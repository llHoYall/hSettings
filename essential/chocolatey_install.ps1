<###############################################################################
 #	@file			essential/chocolatey_install.ps1
 #	@brief		This file installs chocolatey program.
 #	@author		llHoYall <hoya128@gmail.com>
 #	@version	v1.0
 #	@note
 #		- 2018.03.16	Created.
 ##############################################################################>

<# Installation --------------------------------------------------------------#>
Write-Host -NoNewline " => Install "
Write-Host -ForegroundColor Yellow "chocolatey"
If (Get-Command choco -errorAction SilentlyContinue) {
	Write-Host "    Already installed."
}
Else {
	Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}
