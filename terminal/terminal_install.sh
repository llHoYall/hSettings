#!/bin/bash

# Color Definition ------------------------------------------------------------#
red='\033[0;31m'
yellow='\033[0;33m'
nc='\033[0m'

# Install zsh -----------------------------------------------------------------#
if [ -z "$(command -v tmux)" ]; then
	if [ "$(uname)" == "Darwin" ]; then
		brew install tmux
	elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
		sudo apt-get install tmux
	fi
else
	echo -e "${yellow}tmux${nc} has been installed"
	echo
fi

# Setting file ----------------------------------------------------------------#
cp .tmux.conf ~/
