###############################################################################
#   @file       devtool.py
#   @brief      This file installs and configures devtool.
#   @author     llHoYall <hoya128@gmail.com>
###############################################################################
#   @version    v1.0
#   @note
#       - 2018.01.18    Created.
###############################################################################

# Import Module --------------------------------------------------------------#
# Built-In
import os
import sys
import platform
# User
sys.path.append(os.path.dirname(__file__))
sys.path.append(os.path.dirname(os.path.abspath(os.path.dirname(__file__))))
from misc import color  # noqa
import xcode            # noqa
import clang            # noqa
import cmake            # noqa
import embedded         # noqa


# Install --------------------------------------------------------------------#
def install(hos):
    print("==> Install " + color.ORANGE + "shell" + color.END)

    # xcode
    if hos == 'Darwin':
        xcode.install(hos)

    # clang
    if hos == 'Linux':
        clang.install(hos)

    # cmake
    if hos == 'Darwin' or hos == 'Linux':
        cmake.install(hos)

    # embedded
    if hos == 'Darwin' or hos == 'Linux':
        embedded.install(hos)


# Main Routine ---------------------------------------------------------------#
if __name__ == '__main__':
    hos = platform.system()
    install(hos)