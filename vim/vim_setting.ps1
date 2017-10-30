<# Vim Configuration ---------------------------------------------------------#>
Copy-Item _vimrc $HOME

<# Color Configuration -------------------------------------------------------#>
If (!(Test-Path $HOME\vimfiles\colors)) {
	New-Item -Type directory $HOME\vimfiles\colors
}
Copy-Item colors\*.vim $HOME\vimfiles\colors

<# Plugin Configuration ------------------------------------------------------#>
If (!(Test-Path $HOME\vimfiles\plugin)) {
	New-Item -Type directory $HOME\vimfiles\plugin
}
Copy-Item plugin\*.vim $HOME\vimfiles\plugin

If (!(Get-Command git -errorAction SilentlyContinue)) {
	choco install git -y
}
If (!(Test-Path $HOME\.vim\bundle)) {
	git clone https://github.com/VundleVim/Vundle.vim $HOME\.vim\bundle\Vundle.vim
}
vim +PluginInstall +qall
