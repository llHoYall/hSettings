#!/bin/bash
################################################################################
#	@brief		Install clang program.
#	@author		llHoYall <hoya128@gmail.com>
#	@version	v1.0
#	@history
#		2018.01.08	Created.
################################################################################

# Include Scripts -------------------------------------------------------------#
cd $(dirname $0)
. ../../misc/color.sh

# Install Clang ---------------------------------------------------------------#
echo -e " => Install ${YELLOW}clang${END}"
if [ -z "$(command -v clang)" ]; then
	if [ "$(uname -s)" == "Darwin" ]; then
		brew install clang
	elif [ "$(uname -s)" == "Linux" ]; then
		sudo apt install -y clang
	fi
else
	echo "    Already installed"
fi
