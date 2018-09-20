<###############################################################################
 #	@brief		Install ruby program.
 #	@author		llHoYall <hoya128@gmail.com>
 #	@version	v1.0
 #	@history
 #		2018.09.20	Created.
 ##############################################################################>

<# Install Ruby --------------------------------------------------------------#>
Write-Host -NoNewline " => Install "
Write-Host -ForegroundColor YELLOW "ruby"
If (Get-Command ruby -errorAction SilentlyContinue) {
	Write-Host "    Already installed."
}
Else {
	choco install -y ruby
}
