#!/bin/bash
################################################################################
#	@brief		Install cmake program.
#	@author		llHoYall <hoya128@gmail.com>
#	@version	v1.0
#	@history
#		2018.01.17	Created.
################################################################################

# Include Scripts -------------------------------------------------------------#
cd $(dirname $0)
. ../../misc/color.sh

# Install CMake ---------------------------------------------------------------#
echo -e " => Install ${YELLOW}cmake${END}"
if [ -z "$(command -v cmake)" ]; then
	if [ "$(uname -s)" == "Darwin" ]; then
		brew install cmake
	elif [ "$(uname -s)" == "Linux" ]; then
		sudo apt install -y cmake
	fi
else
	echo "    Already installed"
fi
