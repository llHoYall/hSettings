###############################################################################
#   @file       cmake.py
#   @brief      This file installs and configures cmake program.
#   @author     llHoYall <hoya128@gmail.com>
###############################################################################
#   @version    v1.0
#   @note
#       - 2018.01.17    Created.
###############################################################################

# Import Module --------------------------------------------------------------#
# Built-In
import os
import sys
# User
sys.path.append(os.path.dirname(os.path.abspath(os.path.dirname(__file__))))
from misc import color  # noqa


# Install --------------------------------------------------------------------#
def install_linux():
    if os.system("which cmake 1> /dev/null"):
        os.system("sudo apt install -y cmake")
    else:
        print("      Already installed.")
