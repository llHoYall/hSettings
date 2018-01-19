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
import platform
import shutil
# User
sys.path.append(os.path.dirname(os.path.abspath(os.path.dirname(__file__))))
from misc import color  # noqa


# Check installed cmake ------------------------------------------------------#
def _check(hos):
    if hos == 'Darwin' or hos == 'Linux':
        if shutil.which("cmake") == None:
            return False
        return True
    else:
        return False


# Install --------------------------------------------------------------------#
def install(hos):
    print("  => Install " + color.ORANGE + "cmake" + color.END)
    if _check(hos):
        print("     Already installed.")
    else:
        _install(hos)


def _install(hos):
    if hos == 'Darwin':
        os.system("brew install cmake")
    elif hos == 'Linux':
        os.system("sudo apt install -y cmake")
    else:
        print(color.RED + "     Error: Not supported tool" + color.END)


# Main Routine ---------------------------------------------------------------#
if __name__ == '__main__':
    hos = platform.system()
    install(hos)
