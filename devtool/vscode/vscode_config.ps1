<###############################################################################
 #	@brief		Configure vscode program.
 #	@author		llHoYall <hoya128@gmail.com>
 #	@version	v1.0
 #	@history
 #		2018.06.02	Created.
 ##############################################################################>

<# Configure VSCode ----------------------------------------------------------#>
Write-Host -NoNewline " => Config "
Write-Host -ForegroundColor YELLOW "vscode"
If (Get-Command code -errorAction SilentlyContinue) {
	<# Shell #>
	code --install-extension ms-vscode.powershell
	<# Web #>
	code --install-extension xabikos.reactsnippets
	code --install-extension dbaeumer.vscode-eslint
	code --install-extension msjsdiag.debugger-for-chrome
	code --install-extension esbenp.prettier-vscode
	code --install-extension formulahendry.auto-rename-tag
	code --install-extension formulahendry.auto-close-tag
	<# Python #>
	code --install-extension ms-python.python
	<# C/C++ #>
	code --install-extension ms-vscode.cpptools
	code --install-extension twxs.cmake
	code --install-extension webfreak.debug

  If (Test-Path "C:\Users\$($env:UserName)\AppData\Roaming\Code\User\locale.json") {
    Remove-Item "C:\Users\$($env:UserName)\AppData\Roaming\Code\User\locale.json"
  }
  cmd /c mklink /H "C:\Users\$($env:UserName)\AppData\Roaming\Code\User\locale.json" "$($PSScriptRoot)\locale.json"

	If (Test-Path "C:\Users\$($env:UserName)\AppData\Roaming\Code\User\settings.json") {
		Remove-Item "C:\Users\$($env:UserName)\AppData\Roaming\Code\User\settings.json"
	}
	cmd /c mklink /H "C:\Users\$($env:UserName)\AppData\Roaming\Code\User\settings.json" "$($PSScriptRoot)\settings.json"

  If (Test-Path "C:\Users\$($env:UserName)\AppData\Roaming\Code\User\snippets") {
    Remove-Item "C:\Users\$($env:UserName)\AppData\Roaming\Code\User\snippets\*"
  } Else {
    New-Item -ItemType Directory -Path "C:\Users\$($env:UserName)\AppData\Roaming\Code\User\snippets"
	}
  cmd /c mklink /H "C:\Users\$($env:UserName)\AppData\Roaming\Code\User\snippets\c.json" "$($PSScriptRoot)\snippets\c.json"
} Else {
	Write-Host "    Not installed."
}
