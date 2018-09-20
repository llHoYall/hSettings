#!/bin/bash
################################################################################
#	@brief		Install embedded program.
#	@author		llHoYall <hoya128@gmail.com>
#	@version	v1.0
#	@history
#		2018.09.20	Created.
################################################################################

# Include Scripts -------------------------------------------------------------#
cd $(dirname $0)
. ../../misc/color.sh

# Install arm-none-eabi-gcc ---------------------------------------------------#
echo -e " => Install ${YELLOW}arm-none-eabi-gcc${END}"
if [ -z "$(command -v arm-none-eabi-gcc)" ]; then
	if [ "$(uname -s)" == "Darwin" ]; then
		brew cask install gcc-arm-embedded
	elif [ "$(uname -s)" == "Linux" ]; then
		sudo add-apt-repository ppa:team-gcc-arm-embedded/ppa
    sudo apt update
    sudo apt remove gcc-arm-embedded
    sudo apt install -y gcc-arm-embedded
	fi
else
	echo "    Already installed"
fi

# Install ST-flash ------------------------------------------------------------#
echo -e " => Install ${YELLOW}st-flash${END}"
if [ -z "$(command -v st-flash)" ]; then
	if [ "$(uname -s)" == "Darwin" ]; then
		brew install stlink
	elif [ "$(uname -s)" == "Linux" ]; then
		sudo apt-get install git libusb-1.0.0-dev
		git clone --depth 1 https://github.com/texane/stlink && cd stlink
		./.travis.sh
		cd build/Release
		sudo cp * /etc/udev/rules.d/
		sudo udevadm control --reload-rules
		sudo udevadm trigger
	fi
else
	echo "    Already installed"
fi
