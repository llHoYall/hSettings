<###############################################################################
 #	@brief		Installs clang program.
 #	@author		llHoYall <hoya128@gmail.com>
 #	@version	v1.0
 #	@history
 #      2018.01.08	Created.
 ##############################################################################>

<# Install Clang (LLVM) ------------------------------------------------------#>
Write-Host -NoNewline " => Install "
Write-Host -ForegroundColor YELLOW "clang"
If (Get-Command clang -errorAction SilentlyContinue) {
	Write-Host "    Already installed."
}
Else {
	choco install -y llvm
}
