<# Check OS Version ----------------------------------------------------------#>
If ([System.Environment]::OSVersion.Version.Major -lt 10) {
	Write-Host -ForegroundColor RED "Error: Not supported OS version"
	Exit(1)
}

<# Install WSL ---------------------------------------------------------------#>
If (Get-Command bash -errorAction SilentlyContinue) {
	Write-Host -NoNewline -ForegroundColor Yellow "bash"
	Write-Host " has been installed"
}
Else {
	Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
}

<# Download Wsl-Terminal -----------------------------------------------------#>
If (![bool](Get-Command $home\wsl-terminal\open-wsl.exe -errorAction SilentlyContinue)) {
	$url = "https://github.com/goreliu/wsl-terminal/releases/download/v0.8.3/wsl-terminal-0.8.3.zip"
	$output = "$home\wsl-terminal-0.8.3.zip"
	(New-Object System.Net.WebClient).DownloadFile($url, $output)
	Expand-Archive $output -Destination "$home"
}

<# Setting Wsl-Terminal ------------------------------------------------------#>
If ((Get-Command $home\wsl-terminal\open-wsl.exe -errorAction SilentlyContinue)) {
	Copy-Item $path\wsl\wsl-terminal.conf $home\wsl-terminal\etc
	Copy-Item $path\wsl\minttyrc $home\wsl-terminal\etc
}
Write-Host
