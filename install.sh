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
	echo "		- terminal"
	echo "    - shell"
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
if [ $# -lt 1 -o $# -gt 4 ]; then
	usage
	exit 2
fi

# Install Tools ---------------------------------------------------------------#
path=$PWD
cd $(dirname $0)

if [ ${os} = MAC ]; then
	# brew
	echo -e "==> Install ${yellow}brew${nc}"
	if [ -z "$(command -v brew)" ]; then
		/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	else
		echo -e "${yellow}brew${nc} has been installed"
		echo
	fi

	# fzf
	echo -e "==> Install ${yellow}fzf${nc}"
	if [ -z "$(command -v fzf)" ]; then
		brew install fzf
		$(brew --prefix)/opt/fzf/install
	else
		echo -e "${yellow}fzf${nc} has been installed"
		echo
	fi

	# fasd
	echo -e "==> Install ${yellow}fasd${nc}"
	if [ -z "$(command -v fasd)" ]; then
		brew install fasd
	else
		echo -e "${yellow}fasd${nc} has been installed"
		echo
	fi
fi

args=( "$@" )
if [ $# -eq 1 -a $1 == "all" ]; then
	args=( terminal shell git vim )
fi

for i in "${args[@]}"; do
	echo -e "==> Install ${yellow}$i${nc}"
	case $i in
		"terminal")
			terminal/terminal_intall.sh
			;;
		"shell")
			shell/zsh_install.sh
			;;
		"git")
			git/git_install.sh
			;;
		"vim")
			vim/vim_install.sh
			;;
		*)
			echo -e "${red}Error: Not supported tool${nc}"
			echo
	esac
done

# Change Directory ------------------------------------------------------------#
cd $path
