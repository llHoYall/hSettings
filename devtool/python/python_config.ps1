<###############################################################################
 #	@brief		Install python program.
 #	@author		llHoYall <hoya128@gmail.com>
 #	@version	v1.0
 #	@history
 #		2018.09.20	Created.
 ##############################################################################>

<# Install Python3 -----------------------------------------------------------#>
Write-Host -NoNewline " => Config "
Write-Host -ForegroundColor YELLOW "python3"
If (Get-Command python3 -errorAction SilentlyContinue) {
	pip3 install -y autopep8 pylint
}
Else {
	Write-Host "    Already installed."
}
