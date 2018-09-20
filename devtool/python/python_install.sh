#!/bin/bash
################################################################################
#	@brief		Install python program.
#	@author		llHoYall <hoya128@gmail.com>
#	@version	v1.0
#	@history
#		2018.09.20	Created.
################################################################################

# Include Scripts -------------------------------------------------------------#
cd $(dirname $0)
. ../../misc/color.sh

# Install Python3 -------------------------------------------------------------#
echo -e " => Install ${YELLOW}python3${END}"
if [ -z "$(command -v python3)" ]; then
	if [ "$(uname -s)" == "Darwin" ]; then
		brew install python3
	elif [ "$(uname -s)" == "Linux" ]; then
		sudo apt install -y python3
	fi
else
	echo "    Already installed"
fi
