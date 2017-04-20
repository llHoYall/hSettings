#!/bin/bash

# Color Value ##################################################################
red='\033[0;31m'
yellow='\033[0;33m'
nc='\033[0m'

# Usage Function ###############################################################
function usage() {
	echo ""
	echo "[Usage]"
	echo "for MAC or Linux"
	echo "  usage: ./install.sh [all | zsh | git | vim | vscode]"
}

# Check Argument ###############################################################
args=None
if [ $# -ne 1 ]; then
	usage
	exit 1
fi
args=$1
echo

# Check OS #####################################################################
os=None
if [ "$(uname -s)" == "Darwin" ]; then
	os=MAC
	echo "Install OS dependecy tools for MAC"
	if [ -z "$(command -v brew)" ]; then
		echo -e "==> Install ${yellow}brew${nc}"
		/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	fi
	if [ -z "$(command -v git)" ]; then
		echo -e "==> Install ${yellow}git${nc}"
		brew install git
	fi
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
	os=LINUX
	echo "Install OS dependency tools for Linux"
	if [ -z "$(command -v git)" ]; then
		echo -e "==> Install ${yellow}git${nc}"
		apt-get install git
	fi
else
	echo -e "${red}Error: Not supported OS${nc}"
	exit 2
fi

# Install Tools ################################################################
echo "Install tools for ${os}"
if [ ${os} = MAC -o ${os} = LINUX ]; then
	path=$PWD
	cd $(dirname $0)
	echo -e "==> Install ${yellow}${args}${nc}"
	case $1 in
		"zsh")
			zsh/zsh_install.sh
			;;
		"git")
			git/git_setting.sh ${os} ${path}
			;;
		*)
			echo -e "${red}Error: Not supported tool${nc}"
			exit 2
	esac
fi
