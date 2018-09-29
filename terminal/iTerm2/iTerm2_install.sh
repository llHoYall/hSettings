#!/bin/bash
################################################################################
#	@brief		Install iTerm2 program.
#	@author		llHoYall <hoya128@gmail.com>
#	@version	v1.0
#	@history
#		2018.09.29	Created.
################################################################################

# Include Scripts -------------------------------------------------------------#
cd $(dirname $0)
. ../../misc/color.sh

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
echo -e " => Install ${YELLOW}fonts (hack-nerd)${END}"
if [ ! -d "/usr/local/Caskroom/font-hack-nerd-font" ]; then
	if [ "$(uname -s)" == "Darwin" ]; then
		brew tap caskroom/fonts
		brew cask install font-hack-nerd-font
	fi
else
	echo "    Already installed"
fi

echo -e " => Install ${YELLOW}fonts (d2coding)${END}"
if [ ! -d "/usr/local/Caskroom/font-d2coding" ]; then
	if [ "$(uname -s)" == "Darwin" ]; then
		brew cask install caskroom/fonts/font-d2coding
	fi
else
	echo "    Already installed"
fi
