<# Install ConEmu ------------------------------------------------------------#>
If (Get-Command cmder -errorAction SilentlyContinue) {
	Write-Host -NoNewline -ForegroundColor Yellow "cmder"
	Write-Host " has been installed"
}
Else {
	choco install cmder -y
}
Write-Host
