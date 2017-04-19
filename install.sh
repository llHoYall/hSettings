#!/bin/bash

# Color Value ##################################################################
yellow='\033[0;33m'
nc='\033[0m'

# usage function ###############################################################
function usage() {
	echo "for MAC or Linux"
	echo "  usage: ./install.sh [all | zsh | git | vim | vscode]"
	echo "for Windows"
	echo "  usage: sh ./install.sh [all | zsh | git | vim | vscode]"
}

# check OS #####################################################################
os=None
if [ "$(uname -s)" == "Darwin" ]; then
	os=MAC
	echo "Install OS dependecy tools for MAC"
	if [ -z "$(command -v brew)" ]; then
		echo -e " => Install ${yellow}brew${nc}"
		/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	fi
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
	os=LINUX
elif [ "$(expr substr $(uname -s) 1 7)" == "MSYS_NT" ]; then
	os=WINDOWS
else
	echo "Not supported OS"
	exit 1
fi

# check Argument ###############################################################
args=None
if [[ $# -ne 1 ]]; then
	usage
	exit 2
fi
args=$1

# Install Tools ################################################################
if [ $os = MAC -o $os = LINUX ]; then
	cd $(dirname $0)
	echo -e "=== Install ${yellow}${args}${nc} on ${yellow}${os}${nc} ==="
elif [ $os = WINDOWS ]; then
	write-host -NoNewline "=== Install "
	write-host -NoNewline -ForegroundColor "Yellow" $args
	write-host -NoNewline " on "
	write-host -NoNewline -ForegroundColor "Yellow" $os
	write-host " ==="
fi

