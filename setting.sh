#!/bin/bash

# Color Definition ------------------------------------------------------------#
red='\033[0;31m'
yellow='\033[0;33m'
nc='\033[0m'

# Usage Function --------------------------------------------------------------#
function usage() {
	echo "[Usage]"
	echo "for MAC or Linux"
	echo "  usage: ./setting.sh [list of tools]"
	echo "    list of supported tools"
	echo "    - all"
	echo "    - git"
	echo "    - vim"
	echo "  ex: ./setting.sh all"
	echo "  ex: ./setting.sh git vim"
}

# Check OS --------------------------------------------------------------------#
os=None
if [ "$(uname -s)" == "Darwin" ]; then
	os=MAC
	echo "Setting tools for MAC"
	echo
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
	os=LINUX
	echo "Setting tools for Linux"
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

args=( "$@" )
if [ $# -eq 1 -a $1 == "all" ]; then
	args=( git vim )
fi

for i in "${args[@]}"; do
	echo -e "==> Setting ${yellow}$i${nc}"
	case $i in
		"git")
			cd git
			./git_setting.sh $path
			cd $(dirname $0)
			;;
		"vim")
			cd vim
			./vim_setting.sh
			cd $(dirname $0)
			;;
		*)
			echo -e "${red}Error: Not supported tool${nc}"
			echo
	esac
done

# Change Directory ------------------------------------------------------------#
cd $path
