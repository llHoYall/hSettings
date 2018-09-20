#!/bin/bash
################################################################################
#	@brief    Install homebrew program.
#	@author   llHoYall <hoya128@gmail.com>
#	@version	v1.0
#	@history
#		2018.03.07	Created.
################################################################################

# Include Scripts -------------------------------------------------------------#
cd $(dirname $0)
. ../misc/color.sh

# Installation ----------------------------------------------------------------#
echo -e " => Install ${YELLOW}homebrew${END}"
if [ -z "$(command -v brew)" ]; then
	if [ "$(uname -s)" == "Darwin" ]; then
		/usr/bin/ruby -e "$(curl -fsSL https://raw.githubuwercontent.com/Homebrew/install/master/install)"
	fi
else
	echo "    Already installed."
fi
