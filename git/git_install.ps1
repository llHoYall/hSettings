<# Install Git ---------------------------------------------------------------#>
If (Get-Command git -errorAction SilentlyContinue) {
	Write-Host -NoNewline -ForegroundColor Yellow "git"
	Write-Host " is installed"
}
Else {
	choco install git -y
}
