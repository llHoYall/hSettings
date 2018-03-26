#!/bin/bash
################################################################################
#	@file			terminal/iTerm2_install.sh
#	@brief		This file installs iTerm2 program.
#	@author		llHoYall <hoya128@gmail.com>
#	@version	v1.0
#	@note
#		-	2018.03.23	Created.
################################################################################

# Include Scripts -------------------------------------------------------------#
cd $(dirname $0)
. ../misc/color.sh

# Install iTerm2 --------------------------------------------------------------#
echo -e " => Install ${YELLOW}iTerm2${END}"
if [ ! -d "/Applications/iTerm.app" ]; then
	if [ "$(uname -s)" == "Darwin" ]; then
		brew cask install iterm2
	fi
else
	echo "    Already installed"
fi

# Install Fonts ---------------------------------------------------------------#
echo -e " => Install ${YELLOW}fonts${END}"
if [ ! -d "/usr/local/Caskroom/font-hack-nerd-font" ]; then
	if [ "$(uname -s)" == "Darwin" ]; then
		brew tap caskroom/fonts
		brew cask install font-hack-nerd-font
	fi
else
	echo "    Already installed"
fi
