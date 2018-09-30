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

# Configure Node.js -----------------------------------------------------------#
echo -e " => Config ${YELLOW}node${END}"
if [ ! -z "$(command -v nvm)" ]; then
	nvm install latest
	if [ ! -z "$(command -v node)" ]; then
		npm i -g yarn
	fi
else
	echo "    Not installed."
fi
