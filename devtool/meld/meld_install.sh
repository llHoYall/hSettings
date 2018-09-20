#!/bin/bash
################################################################################
#	@brief		Install meld program.
#	@author		llHoYall <hoya128@gmail.com>
#	@version	v1.0
#	@history
#		2018.09.20	Created.
################################################################################

# Include Scripts -------------------------------------------------------------#
cd $(dirname $0)
. ../../misc/color.sh

# Install Meld ----------------------------------------------------------------#
echo -e " => Install ${YELLOW}meld${END}"
if [ -z "$(command -v meld)" ]; then
	if [ "$(uname -s)" == "Darwin" ]; then
		brew install meld
	elif [ "$(uname -s)" == "Linux" ]; then
		sudo apt install -y meld
	fi
else
	echo "    Already installed"
fi
