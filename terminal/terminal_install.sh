#!/bin/bash

# Color Definition ------------------------------------------------------------#
red='\033[0;31m'
yellow='\033[0;33m'
nc='\033[0m'

# Install tmux ----------------------------------------------------------------#
echo -e "==> Install ${yellow}tmux${nc}"
if [ -z "$(command -v tmux)" ]; then
	if [ "$(uname)" == "Darwin" ]; then
		brew install tmux
	elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
		sudo apt install tmux
	fi
else
	echo -e "${yellow}tmux${nc} has been installed"
	echo
fi

# Install tmuxinator ----------------------------------------------------------#
echo -e "==> Install ${yellow}tmuxinator${nc}"
if [ -z "$(command -v tmuxinator)" ]; then
	if [ "$(uname)" == "Darwin" ]; then
		brew install ruby		# update ruby
		gem install tmuxinator
	elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
		sudo apt install tmuxinator
	fi
else
	echo -e "${yellow}tmuxinator${nc} has been installed"
	echo
fi
