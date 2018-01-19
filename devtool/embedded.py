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
import platform
import pathlib
import shutil
# User
sys.path.append(os.path.dirname(os.path.abspath(os.path.dirname(__file__))))
from misc import color  # noqa


# Check installed embedded ---------------------------------------------------#
def _check_gccarm(hos):
    if hos == 'Darwin' or hos == 'Linux':
        if shutil.which("arm-none-eabi-gcc") == None:
            return False
        return True
    else:
        return False


def _check_stlink(hos):
    if hos == 'Darwin' or hos == 'Linux':
        if shutil.which("st-flash") == None:
            return False
        return True
    else:
        return False


# Install --------------------------------------------------------------------#
def install(hos):
    # gcc-arm-embedded
    print("  => Install " + color.ORANGE + "gcc-arm-embedded" + color.END)
    if _check_gccarm(hos):
        print("     Already installed.")
    else:
        _install_gccarm(hos)

    # st-link
    print("  => Install " + color.ORANGE + "st-link" + color.END)
    if _check_stlink(hos):
        print("     Already installed.")
    else:
        _install_stlink(hos)


def _install_gccarm(hos):
    if hos == 'Darwin':
        os.system("brew cask install gcc-arm-embedded")
    elif hos == 'Linux':
        os.system("sudo add-apt-repository ppa:team-gcc-arm-embedded/ppa")
        os.system("sudo apt update")
        os.system("sudo apt remove gcc-arm-embedded")
        os.system("sudo apt install -y gcc-arm-embedded")
    else:
        print(color.RED + "     Error: Not supported tool" + color.END)


def _install_stlink(hos):
    if hos == 'Darwin':
        os.system("brew install stlink")
    else:
        print(color.RED + "     Error: Not supported tool" + color.END)


# Main Routine ---------------------------------------------------------------#
if __name__ == '__main__':
    hos = platform.system()
    install(hos)
