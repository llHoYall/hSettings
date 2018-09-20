#!/bin/bash
################################################################################
#	@brief		Install ceedling program.
#	@author		llHoYall <hoya128@gmail.com>
#	@version	v1.0
#	@history
#		2018.09.20	Created.
################################################################################

# Include Scripts -------------------------------------------------------------#
cd $(dirname $0)
. ../../misc/color.sh

# Install Ceedling ------------------------------------------------------------#
echo -e " => Install ${YELLOW}ceedling${END}"
if [ -z "$(command -v ceedling)" ]; then
	if [ "$(uname -s)" == "Darwin" ]; then
		gem install ceedling
	elif [ "$(uname -s)" == "Linux" ]; then
		sudo gem install ceedling
	fi
else
	echo "    Already installed"
fi
