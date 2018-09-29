#!/bin/bash
################################################################################
#	@brief		Install vscode program.
#	@author		llHoYall <hoya128@gmail.com>
#	@version	v1.0
#	@history
#		2018.09.29	Created.
################################################################################

# Include Scripts -------------------------------------------------------------#
cd $(dirname $0)
. ../../misc/color.sh

# Install Ruby ----------------------------------------------------------------#
echo -e " => Install ${YELLOW}vscode${END}"
if [ -z "$(command -v code)" ]; then
	if [ "$(uname -s)" == "Darwin" ]; then
		brew cask install visual-studio-code
	fi
else
	echo "    Already installed"
fi
