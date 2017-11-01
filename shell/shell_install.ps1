<# Install Powershell Module -------------------------------------------------#>
Install-Module -Name "Posh-Git" -Scope AllUsers
Install-Module -Name "PSColor" -Scope AllUsers

<# Install ConEmu ------------------------------------------------------------#>
If (Get-Command "C:\Program Files\ConEmu\ConEmu64.exe" -errorAction SilentlyContinue) {
	Write-Host -NoNewline -ForegroundColor Yellow "ConEmu"
	Write-Host " has been installed"
}
Else {
	choco install ConEmu -y
}
Write-Host
