#!/bin/bash
################################################################################
#   @file       homebrew_install.sh
#   @brief      This file installs and configures homebrew program.
#   @author     llHoYall <hoya128@gmail.com>
#   @version    v1.0
#   @note
#       - 2018.03.07    Created.
################################################################################

# Include Scripts -------------------------------------------------------------#
cd $(dirname $0)
. ../misc/color.sh

# Installation ----------------------------------------------------------------#
echo -e " => Install ${YELLOW}homebrew${END}"
if [ -z "$(command -v brew)" ]; then
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubuwercontent.com/Homebrew/install/master/install)"
else
	echo -e "    Already installed."
fi
