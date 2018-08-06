#!/bin/bash
################################################################################
#	@file			shell/zsh_install.sh
#	@brief		This file installs zsh program.
#	@author		llHoYall <hoya128@gmail.com>
#	@version	v1.0
#	@note
#		- 2018.04.04	Created.
################################################################################

# Include Scripts -------------------------------------------------------------#
cd $(dirname $0)
. ../../misc/color.sh

# Install Zsh -----------------------------------------------------------------#
echo -e " => Install ${YELLOW}zsh${END}"
if [ -z "$(command -v zsh)" ]; then
	if [ "$(uname -s)" == "Darwin" ]; then
		brew install zsh
	elif [ "$(uname -s)" == "Linux" ]; then
		sudo apt install -y zsh
	fi
	chsh -s $(which zsh)
else
	echo "    Already installed"
fi

# Install oh-my-zsh -----------------------------------------------------------#
echo -e " => Install ${YELLOW}oh-my-zsh${END}"
if [ ! -d ~/.oh-my-zsh ]; then
	curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
else
	echo "    Already installed"
fi

# zsh-syntax-highlighting plugin
if [ ! -d ~/.oh-my-zsh/plugins/zsh-syntax-highlighting ]; then
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting
fi

# zsh-autosuggestions
if [ ! -d ~/.oh-my-zsh/plugins/zsh-autosuggestions ]; then
	git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions
fi
