#!/bin/bash

# Change Directory ------------------------------------------------------------#
cd $(dirname $0)

# Install fish ----------------------------------------------------------------#
if [ -z "$(command -v fish)" ]; then
	if [ "$(uname)" == "Darwin" ]; then
		brew install fish
	elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
		sudo apt-add-repository ppa:fish-shell/release-2
		sudo apt-get update
		sudo apt-get install -y fish
	fi
	chsh -s `which fish`
fi

# Install oh-my-fish ----------------------------------------------------------#
if [ ! -d ~/.oh-my-fish ]; then
	curl -L https://github.com/oh-my-fish/oh-my-fish/raw/master/bin/install | fish
fi

# Setting file ----------------------------------------------------------------#

