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
if [ -z "$(command -v tmux)" ]; then
	if [ "$(uname -s)" == "Darwin" ]; then
		brew cask install iterm2
	fi
else
	echo "    Already installed"
fi
