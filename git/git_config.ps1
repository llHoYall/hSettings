<###############################################################################
 #	@file			git/git_config.ps1
 #	@brief		This file configures git program.
 #	@author		llHoYall <hoya128@gmail.com>
 #	@version	v1.0
 #	@note
 #		- 2018.03.20	Created.
 ##############################################################################>

<# Change Directory ----------------------------------------------------------#>
If ($Args.count -gt 0) {
	Set-Location $Args[0]
}

<# Configure Git -------------------------------------------------------------#>
Write-Host -NoNewline " => Config "
Write-Host -ForegroundColor YELLOW "git"
If (Get-Command git -errorAction SilentlyContinue) {
	Write-Host -NoNewline "    Input scope [("
	Write-Host -NoNewline -ForegroundColor Blue "G"
	Write-Host -NoNewline ")lobal | ("
	Write-Host -NoNewline -ForegroundColor Blue "L"
	Write-Host -NoNewline ")ocal]: "
	$scope = Read-Host
	Write-Host -NoNewline "    Input option [("
	Write-Host -NoNewline -ForegroundColor Blue "N"
	Write-Host -NoNewline ")extChip | ("
	Write-Host -NoNewline -ForegroundColor Blue "H"
	Write-Host -NoNewline ")oYa]: "
	$option = Read-Host
	Switch ($scope) {
		{($_ -ceq "G") -or ($_ -ceq "Global")} {
			# User Name
			If ($option -ceq "N" -or $option -ceq "NC") {
				git config --global user.name "HoYa"
			}
			Elseif ($option -ceq "H" -or $option -ceq "HoYa") {
				git config --global user.name "llHoYall"
			}
			Else {
				Write-Host -ForegroundColor Red "    Invalid option"
				Exit 1
			}

			# User E-mail
			If ($option -ceq "N" -or $option -ceq "NC") {
				git config --global user.email "hoya128@nextchip.com"
			}
			Elseif ($option -ceq "H" -or $option -ceq "HoYa") {
				git config --global user.email "hoya128@gmail.com"
			}
			Else {
				Write-Host -ForegroundColor Red "    Invalid option"
				Exit 1
			}

			# color.ui
			git config --global color.ui auto

			# core.autocrlf
			git config --global core.autocrlf true

			# core.editor
			git config --global core.editor vim

			# credential.helper
			git config --global credential.helper wincred

			# help.autocorrect
			git config --global help.autocorrect 1

			# pull.rebase
			git config --global pull.rebase true

			# push.default
			git config --global push.default simple

			# rerere.enabled
			git config --global rerere.enabled true
		}
		{($_ -ceq "L") -or ($_ -ceq "Local")} {
			# User Name
			If ($option -ceq "N" -or $option -ceq "NC") {
				git config --local user.name "HoYa"
			}
			Elseif ($option -ceq "H" -or $option -ceq "HoYa") {
				git config --local user.name "llHoYall"
			}
			Else {
				Write-Host -ForegroundColor Red "    Invalid option"
				Exit 1
			}

			# User E-mail
			If ($option -ceq "N" -or $option -ceq "NC") {
				git config --local user.email "hoya128@nextchip.com"
			}
			Elseif ($option -ceq "H" -or $option -ceq "HoYa") {
				git config --local user.email "hoya128@gmail.com"
			}
			Else {
				Write-Host -ForegroundColor Red "    Invalid option"
				Exit 1
			}
		}
		Default {
			Write-Host -ForegroundColor Red "    Invalid scope"
			Exit 1
		}
	}
} Else {
	Write-Host "    Not installed."
}