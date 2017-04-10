#!/bin/bash

yellow='\033[0;33m'
nc='\033[0m'

function usage() {
	echo "usage: ./install.sh [zsh | git | vim | vscode]"
}

os=None
if [ "$(uname -s)" == "Darwin" ]; then
	os=MAC
elif [ "$(expr subst $(uname -s) 1 5)" == "Linux" ]; then
	os=LINUX
elif [ "$(expr subst $(uname -s) 1 7)" == "MSYS_NT" ]; then
	os=WINDOWS
else
	echo "Not supported OS"
	exit 1
fi

args=None
if [[ $# -ne 1 ]]; then
	usage
	exit 2
fi
args=$1

echo -e "=== Install ${yellow}${args}${nc} on ${yellow}${os}${nc} ==="

