<# Install WSL ---------------------------------------------------------------#>
if (Get-Command bash -errorAction SilentlyContinue) {
	Write-Host -NoNewline -ForegroundColor "Yellow" "bash"
	Write-Host " is installed"
}
else {
	Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
}

<# Download Wsl-Terminal -----------------------------------------------------#>
$url = "https://github.com/goreliu/wsl-terminal/releases/download/v0.8.3/wsl-terminal-0.8.3.zip"
$output = "$home\wsl-terminal-0.8.3.zip"
if (Get-Command open-wsl -errorAction SilentlyContinue) {
	(New-Object System.Net.WebClient).DownloadFile($url, $output)
	Expand-Archive $output -Destination "$home"
}

<# Setting Wsl-Terminal ------------------------------------------------------#>
Write-Host $path
Write-Host $home

Copy-Item $path\wsl\wsl-terminal.conf $home\wsl-terminal\etc
Copy-Item $path\wsl\minttyrc $home\wsl-terminal\etc
