#!/bin/bash

function Usage() {
	echo
	echo "\033[1mUsage: setGlobalPivate [OS]\033[0m"
	echo "	(M)AC, (L)inux, (W)indows"
	echo
}

if [ $# -ne 1 ]; then
	Usage
	exit 1
fi

# User Name
git config --global user.name "llChameleoNll"

# User E-mail
git config --global user.email "hoya128@gmail.com"

# Push.Default
git config --global push.default simple

# Rerere.Enabled
git config --global rerere.enabled true

# Credential.Helper
case $1 in
	M | MAC)
		git config --global credential.helper osxkeychain
		;;
	L | Linux)
		git config --global credential.helper cache
		;;
	W | Windows)
		git config --global credential.helper winstore
		;;
	*)
		Usage
esac

# Core.Autocrlf
case $1 in
	[ML] | MAC | Linux)
		git config --global core.autocrlf input
		;;
	W | Windows)
		git config --global core.autocrlf true
		;;
	*)
		Usage
esac

