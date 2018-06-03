<###############################################################################
 #	@file			devtool/vscode/vscode_config.ps1
 #	@brief		This file configures vscode program.
 #	@author		llHoYall <hoya128@gmail.com>
 #	@version	v1.0
 #	@note
 #		- 2018.06.02	Created.
 ##############################################################################>

<# Configure VSCode ----------------------------------------------------------#>
Write-Host -NoNewline " => Config "
Write-Host -ForegroundColor YELLOW "vscode"
If (Get-Command code -errorAction SilentlyContinue) {
	code --install-extension ms-vscode.cpptools 
	code --install-extension ms-python.python
	code --install-extension ms-vscode.powershell
	code --install-extension esbenp.prettier-vscode
} Else {
	Write-Host "    Not installed."
}