#!/bin/bash
################################################################################
#	@file			git_install.sh
#	@brief		This file installs git program.
#	@author		llHoYall <hoya128@gmail.com>
#	@version	v1.0
#	@note
#		-	2018.03.16	Created.
################################################################################

# Include Scripts -------------------------------------------------------------#
cd $(dirname $0)
. ../misc/color.sh

# Install Git -----------------------------------------------------------------"
echo -e " => Install ${YELLOW}git${END}"

if [ -z "$(command -v git)" ]; then
	if [ "$(uname -s)" == "Darwin" ]; then
		brew install git git-lfs tig
	elif [ "$(uname -s)" == "Linux" ]; then
		curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
		sudo apt install git git-lfs tig
	fi
else
	echo -e "    Already installed."
fi
