<###############################################################################
 #	@brief		Install web programs.
 #	@author		llHoYall <hoya128@gmail.com>
 #	@version	v1.0
 #	@history
 #		2018.03.20	Created.
 ##############################################################################>

<# Install Node.js -----------------------------------------------------------#>
Write-Host -NoNewline " => Install "
Write-Host -ForegroundColor YELLOW "nvm"
If (Get-Command nvm -errorAction SilentlyContinue) {
	nvm install latest
	If (Get-Command node -errorAction SilentlyContinue) {
		npm i -g yarn eslint
	}
}
Else {
	Write-Host "    Not installed."
}
