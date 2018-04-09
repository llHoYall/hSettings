<###############################################################################
 #	@file			shell/powershell_install.ps1
 #	@brief		This file installs powershell program.
 #	@author		llHoYall <hoya128@gmail.com>
 #	@version	v1.0
 #	@note
 #		- 2018.04.06	Created.
 ##############################################################################>

<# Install Powershell --------------------------------------------------------#>
Write-Host -NoNewline " => Install "
Write-Host -ForegroundColor YELLOW "powershell"
If (Get-Command powershell -errorAction SilentlyContinue) {
	Write-Host "    Already installed."
}

<# Posh-Git Module #>
Write-Host -NoNewline " => Install "
Write-Host -ForegroundColor YELLOW "posh-git"
If (Get-Module -Name "posh-git") {
	Write-Host "    Alread installed."
}
Else {
	Install-Module -Name "posh-git" -Scope AllUsers
}

<# PSColor Module #>
Write-Host -NoNewline " => Install "
Write-Host -ForegroundColor YELLOW "PSColor"
If (Get-Module -Name "PSColor") {
	Write-Host "    Alread installed."
}
Else {
	Install-Module -Name "PSColor" -Scope AllUsers
}

<# PSReadLine Module #>
Write-Host -NoNewline " => Install "
Write-Host -ForegroundColor YELLOW "PSReadLine"
If (Get-Module -Name "PSReadLine") {
	Write-Host "    Alread installed."
}
Else {
	Install-Module -Name "PSReadLine" -Scope AllUsers
}
