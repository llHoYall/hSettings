#!/bin/bash

# Color Definition ------------------------------------------------------------#
red='\033[0;31m'
yellow='\033[0;33m'
nc='\033[0m'

# Usage Function --------------------------------------------------------------#
function usage() {
	echo "[Usage]"
	echo "for MAC or Linux"
	echo "  usage: ./install.sh [list of tools]"
	echo "    list of supported tools"
	echo "    - all"
	echo "    - git"
	echo "    - vim"
	echo "  ex: ./install.sh all"
	echo "  ex: ./install.sh git vim"
}

# Check OS --------------------------------------------------------------------#
os=None
if [ "$(uname -s)" == "Darwin" ]; then
	os=MAC
	echo "Install tools for MAC"
	echo
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
	os=LINUX
	echo "Install tools for Linux"
	echo
else
	echo -e "${red}Error: Not supported OS${nc}"
	echo
	exit 1
fi

# Check Argument --------------------------------------------------------------#
args=None
if [ $# -lt 1 -o $# -gt 2 ]; then
	usage
	exit 2
fi

# Install Tools ---------------------------------------------------------------#
path=$PWD
cd $(dirname $0)

if [ ${os} = MAC ]; then
	echo -e "==> Install ${yellow}brew${nc}"
	if [ -z "$(command -v brew)" ]; then
		/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	else
		echo -e "${yellow}brew${nc} has been installed"
		echo
	fi
fi

args=( "$@" )
if [ $# -eq 1 -a $1 == "all" ]; then
	args=( git vim )
fi

for i in "${args[@]}"; do
	echo -e "==> Install ${yellow}$i${nc}"
	case $i in
		"git")
			git/git_install.sh
			;;
		"vim")
			vim/vim_install.sh
			;;
		*)
			echo -e "${red}Error: Not supported tool"
			exit 3
	esac
done
