#!/bin/bash
################################################################################
#	@brief		Install vim program.
#	@author		llHoYall <hoya128@gmail.com>
#	@version	v1.0
#	@history
#		2018.10.04	Created.
################################################################################

# Include Scripts -------------------------------------------------------------#
cd $(dirname $0)
. ../../misc/color.sh

# Install Vim -----------------------------------------------------------------#
echo -e " => Install ${YELLOW}vim${END}"
if [ -z "$(command -v vim)" ]; then
	if [ "$(uname -s)" == "Darwin" ]; then
		brew install vim
	elif [ "$(uname -s)" == "Linux" ]; then
		sudo apt install -y vim
	fi
else
	echo "    Already installed"
fi

# Install Neovim --------------------------------------------------------------#
echo -e " => Install ${YELLOW}neovim${END}"
if [ -z "$(command -v neovim)" ]; then
	if [ "$(uname -s)" == "Darwin" ]; then
		brew install neovim
	elif [ "$(uname -s)" == "Linux" ]; then
		sudo apt install -y neovim
	fi
else
	echo "    Already installed"
fi

# Install Ctags ---------------------------------------------------------------#
echo -e " => Install ${YELLOW}ctags${END}"
if [ -z "$(command -v ctags)" ]; then
	if [ "$(uname -s)" == "Darwin" ]; then
		brew install ctags
	elif [ "$(uname -s)" == "Linux" ]; then
		sudo apt install -y ctags
	fi
else
	echo "    Already installed"
fi
