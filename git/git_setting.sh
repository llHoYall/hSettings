#!/bin/bash

cd $2

# Get Option ###################################################################
echo -n "    Input scope [(G)lobal | (L)ocal]: "
read scope
echo -n "    Input option [(R)P | (H)oYa]: "
read option

# Set Git Configuration ########################################################
case ${scope} in
	G | Global)
	# Push.Default
	git config --global push.default simple
	# Rerere.Enabled
	git config --global rerere.enabled true
	# Credential.Helper
	case $1 in
		MAC)
			git config --global credential.helper osxkeychain
			;;
		LINUX)
			git config --global credential.helper cache
			;;
		# Windows)
		# 	git config --global credential.helper winstore
		# 	;;
	esac
	# Core.Autocrlf
	case $1 in
		MAC | LINUX)
			git config --global core.autocrlf input
			;;
		# Windows)
		# 	git config --global core.autocrlf true
		# 	;;
	esac

	if [ ${option} == "R" -o ${option} == "RP" ]; then
		# User Name
		git config --global user.name "HoYa"
		# User E-mail
		git config --global user.email "hoya@ixys.net"
	elif [ ${option} == "H" -o ${option} == "HoYa" ]; then
		# User Name
		git config --global user.name "llChameleoNll"
		# User E-mail
		git config --global user.email "hoya128@gmail.com"
	fi
	;;
	L | Local)
		if [ ${option} == "R" -o ${option} == "RP" ]; then
			# User Name
			git config --local user.name "HoYa"
			# User E-mail
			git config --local user.email "hoya@ixys.net"
		elif [ ${option} == "H" -o ${option} == "HoYa" ]; then
			# User Name
			git config --local user.name "llChameleoNll"
			# User E-mail
			git config --local user.email "hoya128@gmail.com"
		fi
		;;
	*)
		echo "Not supported scope"
esac
