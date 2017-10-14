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

(New-Object System.Net.WebClient).DownloadFile($url, $output)
Expand-Archive $output -Destination "$home"
