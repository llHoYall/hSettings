<# Install Vim ---------------------------------------------------------------#>
If (Get-Command vim -errorAction SilentlyContinue) {
	Write-Host -NoNewline -ForegroundColor Yellow "vim"
	Write-Host " has been installed"
}
Else {
	choco install vim -y
}
Write-Host
