<###############################################################################
 #	@brief		Installs vim program.
 #	@author		llHoYall <hoya128@gmail.com>
 #	@version	v1.0
 #	@note
 #		- 2018.06.02	Created.
 ##############################################################################>

<# Install Vim ---------------------------------------------------------------#>
Write-Host -NoNewline " => Install "
Write-Host -ForegroundColor YELLOW "vim"
If (Get-Command vim -errorAction SilentlyContinue) {
	Write-Host "    Already installed."
} Else {
	choco install -y vim
}

<# Install Neovim ------------------------------------------------------------#>
Write-Host -NoNewline " => Install "
Write-Host -ForegroundColor YELLOW "neovim"
If (Get-Command nvim -errorAction SilentlyContinue) {
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
