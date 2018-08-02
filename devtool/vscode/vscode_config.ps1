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
	code --install-extension formulahendry.auto-rename-tag
	code --install-extension formulahendry.auto-close-tag

	If (Test-Path "C:\Users\$($env:UserName)\AppData\Roaming\Code\User\settings.json") {
		Remove-Item "C:\Users\$($env:UserName)\AppData\Roaming\Code\User\settings.json"
	}
	cmd /c mklink /H "C:\Users\$($env:UserName)\AppData\Roaming\Code\User\settings.json" "$($PSScriptRoot)\settings.json"
} Else {
	Write-Host "    Not installed."
}