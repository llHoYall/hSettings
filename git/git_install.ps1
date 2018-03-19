<# Install Git ---------------------------------------------------------------#>
If (Get-Command git -errorAction SilentlyContinue) {
	Write-Host -NoNewline -ForegroundColor Yellow "git"
	Write-Host " has been installed"
}
Else {
	choco install git -y
}
Write-Host

# choco instsall git-lfs
