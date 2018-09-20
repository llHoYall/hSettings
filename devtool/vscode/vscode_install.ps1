<###############################################################################
 #	@brief		Install vscode program.
 #	@author		llHoYall <hoya128@gmail.com>
 #	@version	v1.0
 #	@history
 #		2018.08.02	Created.
 ##############################################################################>

<# Install VSCode ------------------------------------------------------------#>
Write-Host -NoNewline " => Install "
Write-Host -ForegroundColor YELLOW "vscode"
If (Get-Command code -errorAction SilentlyContinue) {
	Write-Host "    Already installed."
} Else {
	choco install -y vscode
}
