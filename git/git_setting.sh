#!/bin/bash

# Color Definition ------------------------------------------------------------#
red='\033[0;31m'
yellow='\033[0;33m'
nc='\033[0m'

# Change Directory ------------------------------------------------------------#
cd $1

# Get Scope & Option from User ------------------------------------------------#
echo -n "    Input scope [(G)lobal | (L)ocal]: "
read scope
echo -n "    Input option [(R)P | (H)oYa]: "
read option

# Set Git Configuration ########################################################
case ${scope} in
	G | Global)
		if [ ${option} == "R" -o ${option} == "RP" ]; then
			# User Name
			git config --global user.name "HoYa"

			# User E-mail
			git config --global user.email "hoya@ixys.net"
		elif [ ${option} == "H" -o ${option} == "HoYa" ]; then
			# User Name
			git config --global user.name "llChameleoNll"

			# User E-mail
			git config --global user.email "hoya128@gmail.com"
		else
			echo -e "${red}Error: Not supported option${nc}"
			echo
			exit 2
		fi

		# Color.ui
		git config --global color.ui auto

		# Core.Autocrlf
		git config --global core.autocrlf input

		# Core.Editor
		git config --global core.editor vim

		# Credential.Helper
		case $1 in
			MAC)
				git config --global credential.helper osxkeychain
				;;
			LINUX)
				git config --global credential.helper cache
				;;
		esac

		# Help.Autocorrect
		git config --global help.autocorrect 1

		# Pull.Rebase
		git config --global pull.rebase true

		# Push.Default
		git config --global push.default simple

		# Rerere.Enabled
		git config --global rerere.enabled true
		;;
	L | Local)
		if [ ${option} == "R" -o ${option} == "RP" ]; then
			# User Name
			git config --local user.name "HoYa"

			# User E-mail
			git config --local user.email "hoya@ixys.net"
		elif [ ${option} == "H" -o ${option} == "HoYa" ]; then
			# User Name
			git config --local user.name "llChameleoNll"

			# User E-mail
			git config --local user.email "hoya128@gmail.com"
		else
			echo -e "${red}Error: Not supported option${nc}"
			echo
			exit 2
		fi
		;;
	*)
		echo -e "${red}Error: Not supported scope${nc}"
		echo
		exit 2
esac
