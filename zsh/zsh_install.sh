#!/bin/bash

# Change Directory ------------------------------------------------------------#
cd $(dirname $0)

# Install RVM (Ruby Version Manager) ------------------------------------------#
if [ -z "$(command -v rvm)" ]; then
	curl -sSL https://get.rvm.io | sudo bash -s stable
fi

# Install zsh -----------------------------------------------------------------#
if [ -z "$(command -v zsh)" ]; then
	if [ "$(uname)" == "Darwin" ]; then
		brew install zsh
	elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
		sudo apt-get install zsh
	fi
	chsh -s `which zsh`
fi

# Install oh-my-zsh -----------------------------------------------------------#
if [ ! -d ~/.oh-my-zsh ]; then
	curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
fi

# Setting file ----------------------------------------------------------------#
cp hoya.zsh-theme ~/.oh-my-zsh/themes/
cp .zshrc ~/

