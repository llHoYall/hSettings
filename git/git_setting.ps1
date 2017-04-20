<# Get Scope & Option from User ----------------------------------------------#>
$scope = Read-Host "    Input scope [(G)lobal | (L)ocal]: "
$option = Read-Host "    Input option [(R)P | (H)oYa]: "

<# Set Git Configuration -----------------------------------------------------#>
switch ($scope) {
	{($_ -ceq "G") -or ($_ -ceq "Global")} {
		# Core.Autocrlf
		git config --global core.autocrlf true

		# Core.Editor
		git config --global core.editor vim

		# Credential.Helper
		git config --global credential.helper winstore

		# Help.Autocorrect
		git config --global help.autocorrect 1

		# Pull.Rebase
		git config --global pull.rebase true

		# Push.Default
		git config --global push.default simple

		# Rerere.Enabled
		git config --global rerere.enabled true

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
	}
	{($_ -ceq "L") -or ($_ -ceq "Local")} {
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
	}
	default {
		Write-Host "Not supported scope"
	}
}
