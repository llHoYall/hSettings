#!/bin/bash

# Color Definition ------------------------------------------------------------#
red='\033[0;31m'
yellow='\033[0;33m'
nc='\033[0m'

# Install Vim -----------------------------------------------------------------"
if [ "$(uname)" == "Darwin" ]; then
	if [ -z "$(command -v vim)" ]; then
		brew install vim -y
	else
		echo -e "${yellow}vim${nc} has been installed"
		echo
	fi
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
	if [ -z "$(command -v vim)" ]; then
		apt-get install vim -y
	else
		echo -e "${yellow}vim${nc} has been installed"
		echo
	fi
fi
