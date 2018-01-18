###############################################################################
#   @file       embedded.py
#   @brief      This file installs and configures embedded program.
#   @author     llHoYall <hoya128@gmail.com>
###############################################################################
#   @version    v1.0
#   @note
#       - 2018.01.16    Created.
###############################################################################

# Import Module --------------------------------------------------------------#
# Built-In
import os
import sys
import shutil
import pathlib
# User
sys.path.append(os.path.dirname(os.path.abspath(os.path.dirname(__file__))))
from misc import color  # noqa


# Install --------------------------------------------------------------------#
def install_mac():
    # gcc-arm-embedded
    print("  => Install " + color.ORANGE + "gcc-arm-embedded" + color.END)
    if os.system("which arm-none-eabi-gcc 1> /dev/null"):
        os.system("brew cask install gcc-arm-embedded")
    else:
        print("       Already installed.")

    # st-link
    print("  => Install " + color.ORANGE + "st-link" + color.END)
    if os.system("which st-flash 1> /dev/null"):
        os.system("brew install stlink")
    else:
        print("       Already installed.")


def install_linux():
    # gcc-arm-embedded
    print("  => Install " + color.ORANGE + "gcc-arm-embedded" + color.END)
    if os.system("which arm-none-eabi-gcc 1> /dev/null"):
        os.system("sudo add-apt-repository ppa:team-gcc-arm-embedded/ppa")
        os.system("sudo apt update")
        os.system("sudo apt remove gcc-arm-embedded")
        os.system("sudo apt install -y gcc-arm-embedded")
    else:
        print("      Already installed.")
