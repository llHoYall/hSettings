#!/bin/bash
################################################################################
#	@file			git_config.sh
#	@brief		This file configures git program.
#	@author		llHoYall <hoya128@gmail.com>
#	@version	v1.0
#	@note
#		- 2018.03.16	Created.
################################################################################

# Include Scripts -------------------------------------------------------------#
cd $(dirname $0)
. ../misc/color.sh

# Change Directory ------------------------------------------------------------#
cd - > /dev/null

# Configure Git ---------------------------------------------------------------#
echo -e " => Config ${YELLOW}git${END}"
if [ ! -z "$(command -v git)" ]; then
	echo -ne "    Input scope [(${BLUE}G${END})lobal | (${BLUE}L${END})ocal]: "
	read scope
	echo -ne "    Input option [(${BLUE}N${END})extChip | (${BLUE}H${END})oYa]: "
	read option

	case ${scope} in
		G | Global)
			# user.name
			if [ ${option} == "R" -o ${option} == "RP" ]; then
				git config --global user.name "HoYa"
			elif [ ${option} == "H" -o ${option} == "HoYa" ]; then
				git config --global user.name "llHoYall"
			else
				echo -e "    ${RED}Invalid option${END}"
				exit 1
			fi

			# user.email
			if [ ${option} == "R" -o ${option} == "RP" ]; then
				git config --global user.email "hoya128@nextchip.com"
			elif [ ${option} == "H" -o ${option} == "HoYa" ]; then
				git config --global user.email "hoya128@gmail.com"
			else
				echo -e "    ${RED}Invalid option${END}"
				exit 1
			fi

			# color.ui
			git config --global color.ui auto

			# core.autocrlf
			git config --global core.autocrlf input

			# core.editor
			git config --global core.editor vim

			# credential.helper
			if [ "$(uname -s)" == "Darwin" ]; then
				git config --global credential.helper osxkeychain
			elif [ "$(uname -s)" == "Linux" ]; then
				git config --global credential.helper store
			fi

			# help.autocorrect
			git config --global help.autocorrect 1

			# pull.rebase
			git config --global pull.rebase true

			# push.default
			git config --global push.default simple

			# rerere.enabled
			git config --global rerere.enabled true
			;;

			# alias
			git config --global alias.st status
		L | Local)
			# user.name
			if [ ${option} == "N" -o ${option} == "NC" ]; then
				git config --local user.name "HoYa"
			elif [ ${option} == "H" -o ${option} == "HoYa" ]; then
				git config --local user.name "llHoYall"
			else
				echo -e "    ${RED}Invalid option${END}"
				exit 1
			fi

			# user.email
			if [ ${option} == "N" -o ${option} == "NC" ]; then
				git config --local user.email "hoya128@nextchip.com"
			elif [ ${option} == "H" -o ${option} == "HoYa" ]; then
				git config --local user.email "hoya128@gmail.com"
			else
				echo -e "    ${RED}Invalid option${END}"
				exit 1
			fi
			;;
		*)
			echo -e "    ${RED}Invalid scope${END}"
			exit 1
	esac
else
	echo "    Not installed."
fi
