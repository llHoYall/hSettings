<###############################################################################
 #	@file			git/git_config.ps1
 #	@brief		This file configures git program.
 #	@author		llHoYall <hoya128@gmail.com>
 #	@version	v1.0
 #	@note
 #		- 2018.03.20	Created.
 ##############################################################################>

<# Change Directory ----------------------------------------------------------#>
<#Set-Location $Args[0] #>
(Get-Location).path

<# Configure  Git ------------------------------------------------------------#>
Write-Host -NoNewline "    Input scope [("
Write-Host -NoNewline -ForegroundColor BLUE "G"
Write-Host -NoNewline ")lobal | ("
Write-Host -NoNewline -ForegroundColor BLUE "L"
Write-Host -NoNewline ")ocal]: "
$scope = Read-Host
Write-Host -NoNewline "    Input option [("
Write-Host -NoNewline -ForegroundColor BLUE "R"
Write-Host -NoNewline ")P | ("
Write-Host -NoNewline -ForegroundColor BLUE "H"
Write-Host -NoNewline ")oYa]: "
$option = Read-Host
switch ($scope) {
	{($_ -ceq "G") -or ($_ -ceq "Global")} {
		# User Name
		if ($option -ceq "R" -or $option -ceq "RP") {
			git config --global user.name "HoYa"
		} elseif ($option -ceq "H" -or $option -ceq "HoYa") {
			git config --global user.name "llChameleoNll"
		} else {
			Write-Host -ForegroundColor "    Invalid option"
			Exit 1
		}

		# User E-mail
		if ($option -ceq "R" -or $option -ceq "RP") {
			git config --global user.email "hoya@ixys.net"
		}
		elseif ($option -ceq "H" -or $option -ceq "HoYa") {
			git config --global user.email "hoya128@gmail.com"
		}
		else {
			Write-Host -ForegroundColor "    Invalid option"
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
		if ($option -ceq "R" -or $option -ceq "RP") {
			git config --local user.name "HoYa"
		} elseif ($option -ceq "H" -or $option -ceq "HoYa") {
			git config --local user.name "llChameleoNll"
		} else {
			Write-Host -ForegroundColor "    Invalid option"
			Exit 1
		}

		# User E-mail
		if ($option -ceq "R" -or $option -ceq "RP") {
			git config --local user.email "hoya@ixys.net"
		}
		elseif ($option -ceq "H" -or $option -ceq "HoYa") {
			git config --local user.email "hoya128@gmail.com"
		}
		else {
			Write-Host -ForegroundColor "    Invalid option"
			Exit 1
		}
	}
	default {
		Write-Host -ForegroundColor "    Invalid scope"
		Exit 1
	}
}
