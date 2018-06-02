<###############################################################################
 #	@file			devtool/neovim/neovim_install.ps1
 #	@brief		This file installs neovim program.
 #	@author		llHoYall <hoya128@gmail.com>
 #	@version	v1.0
 #	@note
 #		- 2018.06.02	Created.
 ##############################################################################>

<# Install NeoVim ------------------------------------------------------------#>
Write-Host -NoNewline " => Install "
Write-Host -ForegroundColor YELLOW "neovim"
If (Get-Command neovim -errorAction SilentlyContinue) {
	Write-Host "    Already installed."
} Else {
	choco install -y neovim
}

<# Install Ctags -------------------------------------------------------------#>
Write-Host -NoNewline " => Install "
Write-Host -ForegroundColor YELLOW "ctags"
If (Get-Command ctags -errorAction SilentlyContinue) {
	Write-Host "    Already installed."
} Else {
	choco install -y ctags
}
