#!/bin/bash

# Color Definition ------------------------------------------------------------#
red='\033[0;31m'
yellow='\033[0;33m'
nc='\033[0m'

# Install zsh -----------------------------------------------------------------#
if [ -z "$(command -v zsh)" ]; then
	if [ "$(uname)" == "Darwin" ]; then
		brew install zsh
	elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
		sudo apt-get install zsh
	fi
	chsh -s $(which zsh)
else
	echo -e "${yellow}zsh${nc} has been installed"
	echo
fi

# Install oh-my-zsh -----------------------------------------------------------#
if [ ! -d ~/.oh-my-zsh ]; then
	curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
fi

# zsh-syntax-highlighting plugin
if [ ! -d ~/.oh-my-zsh/plugins/zsh-syntax-highlighting ]; then
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting
fi

# zsh-autosuggestions
if [ ! -d ~/.oh-my-zsh/plugins/zsh-autosuggestions ]; then
	git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions
fi

# Setting file ----------------------------------------------------------------#
cp shell/hoya.zsh-theme ~/.oh-my-zsh/themes/
cp shell/.zshrc ~/
