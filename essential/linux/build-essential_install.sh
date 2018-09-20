#!/bin/bash
################################################################################
#	@brief    Install build-essential.
#	@author   llHoYall <hoya128@gmail.com>
#	@version	v1.0
#	@history
#		2018.03.07	Created.
################################################################################

# Include Scripts -------------------------------------------------------------#
cd $(dirname $0)
. ../../misc/color.sh

# Installation ----------------------------------------------------------------#
echo -e " => Install ${YELLOW}build-essential${END}"
if [ -z "$(command -v gcc)" ] && [ -z "$(command -v make)" ]; then
	if [ "$(uname -s)" == "Linux" ]; then
		sudo apt install -y build-essential
	fi
else
	echo "    Already installed."
fi
