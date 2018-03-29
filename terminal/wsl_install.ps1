<###############################################################################
 #	@file			terminal/wsl_install.ps1
 #	@brief		This file installs WSL program.
 #	@author		llHoYall <hoya128@gmail.com>
 #	@version	v1.0
 #	@note
 #		- 2018.03.29	Created.
 ##############################################################################>

<# Check OS Version ----------------------------------------------------------#>
If ([System.Environment]::OSVersion.Version.Major -lt 10) {
	Write-Host -ForegroundColor RED "    Error: Not supported OS version"
	Write-Host
	Return
}

<# Install WSL ---------------------------------------------------------------#>
Write-Host -NoNewline " => Install "
Write-Host -ForegroundColor Yellow "wsl"
If (Get-Command bash -errorAction SilentlyContinue) {
	Write-Host "    Already installed."
}
Else {
	Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
}

<# Install Wsl-Terminal ------------------------------------------------------#>
If (![bool](Get-Command $home\wsl-terminal\open-wsl.exe -errorAction SilentlyContinue)) {
	$url = "https://github.com/goreliu/wsl-terminal/releases/download/v0.8.10/wsl-terminal-0.8.10.zip"
	$output = "$home\wsl-terminal-0.8.10.zip"
	(New-Object System.Net.WebClient).DownloadFile($url, $output)
	Expand-Archive $output -Destination "$home"
}

<# Setting Wsl-Terminal ------------------------------------------------------#>
If (Get-Command $home\wsl-terminal\open-wsl.exe -errorAction SilentlyContinue) {
	Copy-Item $path\wsl\wsl-terminal.conf $home\wsl-terminal\etc
	Copy-Item $path\wsl\minttyrc $home\wsl-terminal\etc
}
Write-Host
