<###############################################################################
 #	@file			terminal/hyper_config.ps1
 #	@brief		This file configures Hyper program.
 #	@author		llHoYall <hoya128@gmail.com>
 #	@version	v1.0
 #	@note
 #		- 2018.07.08	Created.
 ##############################################################################>

<# Configure Hyper -----------------------------------------------------------#>
Write-Host -NoNewline " => Config "
Write-Host -ForegroundColor YELLOW "Hyper"
If (Get-Command hyper -errorAction SilentlyContinue) {
	If (Test-Path "C:\Users\$($env:UserName)\.hyper.js") {
		Remove-Item "C:\Users\$($env:UserName)\.hyper.js"
	}
	cmd /c mklink /H "C:\Users\$($env:UserName)\.hyper.js" "$($PSScriptRoot)\.hyper.js"
}
Else {
	Write-Host "    Not installed."
}
