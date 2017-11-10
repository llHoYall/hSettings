<# Install Powershell Module -------------------------------------------------#>
Install-Module -Name "posh-git" -Scope AllUsers
Install-Module -Name "PSColor" -Scope AllUsers
Copy-Item shell\Microsoft.Powershell_profile.ps1 $PROFILE

<# Install ConEmu ------------------------------------------------------------#>
If (Get-Command "C:\Program Files\ConEmu\ConEmu64.exe" -errorAction SilentlyContinue) {
	Write-Host -NoNewline -ForegroundColor Yellow "ConEmu"
	Write-Host " has been installed"
}
Else {
	choco install ConEmu -y
}
Copy-Item shell\ConEmu.xml $HOME\AppData\Roaming\ConEmu.xml

<# Install Putty -------------------------------------------------------------#>
If (Get-Command putty -errorAction SilentlyContinue)) {
		choco install putty -y
}

Write-Host
