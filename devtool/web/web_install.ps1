<###############################################################################
 #	@brief		Install web programs.
 #	@author		llHoYall <hoya128@gmail.com>
 #	@version	v1.0
 #	@history
 #		2018.03.20	Created.
 ##############################################################################>

<# Install NVM ---------------------------------------------------------------#>
Write-Host -NoNewline " => Install "
Write-Host -ForegroundColor YELLOW "nvm"
If (Get-Command nvm -errorAction SilentlyContinue) {
	Write-Host "    Already installed."
} Else {
	choco install -y nvm
}
