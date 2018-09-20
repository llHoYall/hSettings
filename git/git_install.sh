#!/bin/bash
################################################################################
#	@brief		Install git program.
#	@author		llHoYall <hoya128@gmail.com>
#	@version	v1.0
#	@history
#		2018.03.16	Created.
################################################################################

# Include Scripts -------------------------------------------------------------#
cd $(dirname $0)
. ../misc/color.sh

# Install Git -----------------------------------------------------------------#
echo -e " => Install ${YELLOW}git${END}"
if [ -z "$(command -v git)" ]; then
	if [ "$(uname -s)" == "Darwin" ]; then
		brew install git
	elif [ "$(uname -s)" == "Linux" ]; then
		sudo apt install -y git
	fi
else
	echo "    Already installed."
fi

# Install Git-LFS -------------------------------------------------------------#
echo -e " => Install ${YELLOW}git-lfs${END}"
if [ -z "$(command -v git-lfs)" ]; then
	if [ "$(uname -s)" == "Darwin" ]; then
		brew install git-lfs
	elif [ "$(uname -s)" == "Linux" ]; then
		sudo apt install -y git-lfs
	fi
else
	echo "    Already installed."
fi

# Install Tig -----------------------------------------------------------------#
echo -e " => Install ${YELLOW}tig${END}"
if [ -z "$(command -v tig)" ]; then
	if [ "$(uname -s)" == "Darwin" ]; then
		brew install tig
	elif [ "$(uname -s)" == "Linux" ]; then
		sudo apt install -y tig
	fi
else
	echo "    Already installed."
fi
