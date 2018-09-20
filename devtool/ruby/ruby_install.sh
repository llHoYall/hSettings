#!/bin/bash
################################################################################
#	@brief		Install ruby program.
#	@author		llHoYall <hoya128@gmail.com>
#	@version	v1.0
#	@history
#		2018.09.20	Created.
################################################################################

# Include Scripts -------------------------------------------------------------#
cd $(dirname $0)
. ../../misc/color.sh

# Install Ruby ----------------------------------------------------------------#
echo -e " => Install ${YELLOW}ruby${END}"
if [ -z "$(command -v ruby)" ]; then
	if [ "$(uname -s)" == "Darwin" ]; then
		brew install ruby
	elif [ "$(uname -s)" == "Linux" ]; then
		sudo apt install -y ruby
	fi
else
	echo "    Already installed"
fi
