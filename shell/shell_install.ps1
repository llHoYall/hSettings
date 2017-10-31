<# Install ConEmu ------------------------------------------------------------#>
If (Get-Command "C:\Program Files\ConEmu\ConEmu64.exe" -errorAction SilentlyContinue) {
	Write-Host -NoNewline -ForegroundColor Yellow "ConEmu"
	Write-Host " has been installed"
}
Else {
	choco install ConEmu -y
}
Copy-Item $path\shell\ConEmu.xml $HOME\AppData\Roaming
Write-Host
