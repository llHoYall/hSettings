<###############################################################################
 #	@brief		Install ceedling program.
 #	@author		llHoYall <hoya128@gmail.com>
 #	@version	v1.0
 #	@history
 #		2018.09.20	Created.
 ##############################################################################>

<# Install Ceedling ----------------------------------------------------------#>
Write-Host -NoNewline " => Install "
Write-Host -ForegroundColor YELLOW "ceedling"
If (Get-Command ceedling -errorAction SilentlyContinue) {
	Write-Host "    Already installed."
}
Else {
	gem install ceedling
}
