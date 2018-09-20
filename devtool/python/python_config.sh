#!/bin/bash
################################################################################
#	@brief		Configure python program.
#	@author		llHoYall <hoya128@gmail.com>
#	@version	v1.0
#	@history
#		2018.09.20	Created.
################################################################################

# Include Scripts -------------------------------------------------------------#
cd $(dirname $0)
. ../../misc/color.sh

# Configure Python3 -----------------------------------------------------------#
echo -e " => Config ${YELLOW}python3${END}"
if [ ! -z "$(command -v python3)" ]; then
	if [ "$(uname -s)" == "Darwin" ]; then
		pip3 install -y autopep8 pylint
	elif [ "$(uname -s)" == "Linux" ]; then
		sudo pip3 install -y autopep8 pylint
	fi
else
	echo "    Not installed."
fi
