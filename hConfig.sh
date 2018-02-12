#!/bin/bash

# Includes --------------------------------------------------------------------#
path=$PWD
cd $(dirname $0)
. misc/color.sh

# Usage Function --------------------------------------------------------------#
function usage() {
	echo
	echo -ne $BR_WHITE"  Usage: "$END
	echo -e $YELLOW"./hConfig.sh [opt] [tools]"$END
	echo
	echo -e $GREEN"    opt"$END
	echo -e "    -a\tInstall and Configure. (Default)"
	echo -e "    -i\tInstall only"
	echo -e "    -c\tConfigure only"
	echo -e "    -h\tHelp"
	echo
	echo -e $GREEN"    tools"$END
	echo -e "    essential\tInstall"
}

# Check Argument --------------------------------------------------------------#
args=None
opt=a
if [ $# -gt 0 ]; then
	if [ $1 == "-i" ]; then
		opt=i
	elif [ $1 == "-c" ]; then
		opt=c
	else
		usage
		exit
	fi
fi
if [ $# -eq 1 -a $1 == '-h' ]; then
	usage
	exit
fi

args=( "$@" )
if [ $# -eq 1 -a $1 == "all" ]; then
	args=( terminal shell git vim )
fi

# Check OS --------------------------------------------------------------------#
hos=None
if [ "$(uname -s)" == "Darwin" ]; then
	hos=MAC
	echo "Install tools for MAC"
	echo
elif [ "$(uname -s)" == "Linux" ]; then
	hos=LINUX
	echo "Install tools for Linux"
	echo
else
	echo -e "${red}Error: Not supported OS${nc}"
	echo
	exit 1
fi

# Install Tools ---------------------------------------------------------------#
# fzf
#echo -e "==> Install ${yellow}fzf${nc}"
#if [ -z "$(command -v fzf)" ]; then
#	if [ ${os} = MAC ]; then
#   brew install fzf
#		$(brew --prefix)/opt/fzf/install
#	elif [ ${os} = LINUX ]; then
#		if [ -z "$(command -v git)" ]; then
#			sudo apt install git -y
#		fi
#		git clone --depth 1 https://github.com/junegunn/fzf ~/.fzf
#		~/.fzf/install
#	fi
#else
#	echo -e "${yellow}fzf${nc} has been installed"
#	echo
#	if [ ${os} = MAC ]; then
#		brew reinstall fzf
#	elif [ ${os} = LINUX ]; then
#		cd ~/.fzf && git pull && ./install
#		cd -
#	fi
#fi

# fasd
#echo -e "==> Install ${yellow}fasd${nc}"
#if [ -z "$(command -v fasd)" ]; then
#	if [ ${os} = MAC ]; then
#		brew install fasd
#	elif [ ${os} = LINUX ]; then
#		if [ -z "$(command -v git)" ]; then
#			sudo apt install git -y
#		fi
#		git clone --depth 1 https://github.com/clvv/fasd ~/.fasd
#		cd ~/.fasd && sudo make install
#		cd -
#	fi
#else
#	echo -e "${yellow}fasd${nc} has been installed"
#	echo
#fi

if [ $opt == 'i' ]; then
	echo -n "Install tools for "
elif [ $opt == 'c' ]; then
	echo -n "Configure tools for "
else
	echo -n "Install & Configure tools for "
fi

if [ $hos == 'MAC' ]; then
	echo -e $MAGENTA"Mac"$END
elif [ $hos == 'LINUX' ]; then
	echo -e $MAGENTA"Linux"$END
fi

if [ $opt == 'i' ]; then
	install $hos $args
elif [ $opt == 'c' ]; then
	config $hos $args
else
	install $hos $args
	config $hos $args
fi

#for i in "${args[@]}"; do
#	echo -e "==> Install ${yellow}$i${nc}"
#	case $i in
#		"terminal")
#			terminal/terminal_install.sh
#			;;
#		"shell")
#			shell/zsh_install.sh
#			;;
#		"git")
#			git/git_install.sh
#			;;
#		"vim")
#			vim/vim_install.sh
#			;;
#		*)
#			echo -e "${red}Error: Not supported tool${nc}"
#			echo
#	esac
#done

# Change Directory ------------------------------------------------------------#
cd $path
