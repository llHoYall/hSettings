<# Change Directory ----------------------------------------------------------#>
cd $Args[0]

<# Get Scope & Option from User ----------------------------------------------#>
$scope = Read-Host "    Input scope [(G)lobal | (L)ocal]: "
$option = Read-Host "    Input option [(R)P | (H)oYa]: "

<# Set Git Configuration -----------------------------------------------------#>
switch ($scope) {
	{($_ -ceq "G") -or ($_ -ceq "Global")} {
		if ($option -ceq "R" -or $option -ceq "RP") {
			# User Name
			git config --global user.name "HoYa"

			# User E-mail
			git config --global user.email "hoya@ixys.net"
		}
		elseif ($option -ceq "H" -or $option -ceq "HoYa") {
			# User Name
			git config --global user.name "llChameleoNll"

			# User E-mail
			git config --global user.email "hoya128@gmail.com"
		}
		else {
			Write-Host -ForegroundColor RED "Error: Not supported option"
			Write-Host
			Exit(2)
		}

		# Color.Ui
		git config --global color.ui auto

		# Core.Autocrlf
		git config --global core.autocrlf true

		# Core.Editor
		git config --global core.editor vim

		# Credential.Helper
		git config --global credential.helper wincred

		# Help.Autocorrect
		git config --global help.autocorrect 1

		# Pull.Rebase
		git config --global pull.rebase true

		# Push.Default
		git config --global push.default simple

		# Rerere.Enabled
		git config --global rerere.enabled true
	}
	{($_ -ceq "L") -or ($_ -ceq "Local")} {
		if ($option -ceq "R" -or $option -ceq "RP") {
			# User Name
			git config --local user.name "HoYa"

			# User E-mail
			git config --local user.email "hoya@ixys.net"
		}
		elseif ($option -ceq "H" -or $option -ceq "HoYa") {
			# User Name
			git config --local user.name "llChameleoNll"

			# User E-mail
			git config --local user.email "hoya128@gmail.com"
		}
		else {
			Write-Host -ForegroundColor RED "Error: Not supported option"
			Write-Host
			Exit(2)
		}
	}
	default {
		Write-Host -ForegroundColor RED "Error: Not supported scope"
		Write-Host
		Exit(2)
	}
}
Write-Host
