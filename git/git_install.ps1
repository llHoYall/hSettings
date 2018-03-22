<###############################################################################
 #	@file			git/git_install.ps1
 #	@brief		This file installs git program.
 #	@author		llHoYall <hoya128@gmail.com>
 #	@version	v1.0
 #	@note
 #		- 2018.03.20	Created.
 ##############################################################################>

<# Install Git ---------------------------------------------------------------#>
Write-Host -NoNewline " => Install "
Write-Host -ForegroundColor YELLOW "git"
If (Get-Command git -errorAction SilentlyContinue) {
	Write-Host "    Already installed."
}
Else {
	choco install -y git
}

<# Install Git-LFS -----------------------------------------------------------#>
Write-Host -NoNewline " => Install "
Write-Host -ForegroundColor YELLOW "git-lfs"
If (Get-Command git-lfs -errorAction SilentlyContinue) {
	Write-Host "    Already installed."
}
Else {
	choco install -y git-lfs
}
