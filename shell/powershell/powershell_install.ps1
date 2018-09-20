<###############################################################################
 #	@brief		Install powershell program.
 #	@author		llHoYall <hoya128@gmail.com>
 #	@version	v1.0
 #	@history
 #		2018.04.06	Created.
 ##############################################################################>

<# Install Powershell --------------------------------------------------------#>
Write-Host -NoNewline " => Install "
Write-Host -ForegroundColor YELLOW "powershell"
If (Get-Command powershell -errorAction SilentlyContinue) {
	Write-Host "    Already installed."
}

<# Posh-Git Module #>
If (!(Get-Module -Name "posh-git")) {
	Install-Module -Name "posh-git" -Scope AllUsers
}

<# PSColor Module #>
If (!(Get-Module -Name "PSColor")) {
	Install-Module -Name "PSColor" -Scope AllUsers
}

<# PSReadLine Module #>
If (!(Get-Module -Name "PSReadLine")) {
	Install-Module -Name "PSReadLine" -Scope AllUsers
}
