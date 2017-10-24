<# Color Configuration -------------------------------------------------------#>
If (!(Test-Path $HOME\vimfiles\colors)) {
	New-Item -Type directory $HOME\vimfiles\colors
}
Copy-Item colors\*.vim $HOME\vimfiles\colors
