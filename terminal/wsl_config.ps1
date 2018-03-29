<###############################################################################
 #	@file			terminal/wsl_config.ps1
 #	@brief		This file configures WSL program.
 #	@author		llHoYall <hoya128@gmail.com>
 #	@version	v1.0
 #	@note
 #		- 2018.03.29	Created.
 ##############################################################################>

<# Check OS Version ----------------------------------------------------------#>
If ([System.Environment]::OSVersion.Version.Major -lt 10) {
	Write-Host -ForegroundColor RED "    Error: Not supported OS version"
	Return
}

<# Setting Wsl-Terminal ------------------------------------------------------#>
Write-Host -NoNewline " => Config "
Write-Host -ForegroundColor YELLOW "wsl"
If (Get-Command $home\wsl-terminal\open-wsl.exe -errorAction SilentlyContinue) {
	cmd /c mklink /H "$path\wsl\wsl-terminal.conf" "$home\wsl-terminal\etc"
	cmd /c mklink /H "$path\wsl\minttyrc" "$home\wsl-terminal\etc"
}
Else {
	Write-Host "    Not installed."
}
