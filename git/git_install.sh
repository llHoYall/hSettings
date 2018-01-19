#!/bin/bash

# Color Definition ------------------------------------------------------------#
red='\033[0;31m'
yellow='\033[0;33m'
nc='\033[0m'

# Install Git -----------------------------------------------------------------"
if [ "$(uname -s)" == "Darwin" ]; then
	if [ -z "$(command -v git)" ]; then
		brew install git
	else
		echo -e "${yellow}git${nc} has been installed"
		echo
	fi
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
	if [ -z "$(command -v git)" ]; then
		apt-get install git -y
	else
		echo -e "${yellow}git${nc} has been installed"
		echo
	fi
else
	echo -e "${red}Error: Not supported OS${nc}"
	echo
fi
