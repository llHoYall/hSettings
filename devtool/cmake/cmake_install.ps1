<###############################################################################
 #	@brief		Install cmake program.
 #	@author		llHoYall <hoya128@gmail.com>
 #	@version	v1.0
 #	@history
 #		2018.01.17	Created.
 ##############################################################################>

<# Install CMake -------------------------------------------------------------#>
Write-Host -NoNewline " => Install "
Write-Host -ForegroundColor YELLOW "cmake"
If (Get-Command cmake -errorAction SilentlyContinue) {
	Write-Host "    Already installed."
}
Else {
	choco install -y cmake
}
