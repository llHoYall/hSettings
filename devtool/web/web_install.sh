#!/bin/bash
################################################################################
#	@brief		Install web program.
#	@author		llHoYall <hoya128@gmail.com>
#	@version	v1.0
#	@history
#		2018.09.21	Created.
################################################################################

# Include Scripts -------------------------------------------------------------#
cd $(dirname $0)
. ../../misc/color.sh

# Install NVM -----------------------------------------------------------------#
echo -e " => Install ${YELLOW}nvm${END}"
if [ -z "$(command -v nvm)" ]; then
	if [ "$(uname -s)" == "Darwin" ]; then
		brew install nvm
	elif [ "$(uname -s)" == "Linux" ]; then
		sudo apt install -y nvm
	fi
else
	echo "    Already installed"
fi
