<###############################################################################
 #	@brief		Configure vim program.
 #	@author		llHoYall <hoya128@gmail.com>
 #	@version	v1.0
 #	@history
 #		2018.10.04	Created.
 ##############################################################################>

<# Configure Neovim ----------------------------------------------------------#>
Write-Host -NoNewline " => Config "
Write-Host -ForegroundColor YELLOW "neovim"
If (Get-Command nvim -errorAction SilentlyContinue) {
	Remove-Item "C:\Users\$($env:UserName)\.config\nvim\pack\bundle\start\fzf"
	git clone https://github.com/junegunn/fzf ~/.config/nvim/pack/bundle/start
} Else {
	Write-Host "    Not installed."
}

# <# Vim Configuration ---------------------------------------------------------#>
# Copy-Item _vimrc $HOME

# <# Color Configuration -------------------------------------------------------#>
# If (!(Test-Path $HOME\vimfiles\colors)) {
# 	New-Item -Type directory $HOME\vimfiles\colors
# }
# Copy-Item colors\*.vim $HOME\vimfiles\colors

# <# Plugin Configuration ------------------------------------------------------#>
# If (!(Test-Path $HOME\vimfiles\plugin)) {
# 	New-Item -Type directory $HOME\vimfiles\plugin
# }
# Copy-Item plugin\*.vim $HOME\vimfiles\plugin

# If (!(Get-Command git -errorAction SilentlyContinue)) {
# 	choco install git -y
# }
# If (!(Test-Path $HOME\.vim\bundle)) {
# 	git clone https://github.com/VundleVim/Vundle.vim $HOME\.vim\bundle\Vundle.vim
# }
# Else {
# 	Push-Location
# 	cd $HOME\vimfiles\bundle\Vundle.vim
# 	git pull
# 	Pop-Location
# }
# vim +PluginInstall! +qall
