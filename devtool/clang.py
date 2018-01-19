###############################################################################
#   @file       clang.py
#   @brief      This file installs and configures clang program.
#   @author     llHoYall <hoya128@gmail.com>
###############################################################################
#   @version    v1.0
#   @note
#       - 2018.01.08    Created.
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


# Install --------------------------------------------------------------------#
def install(hos):
    print("  => Install " + color.ORANGE + "clang" + color.END)
    if shutil.which("clang") == None:
        os.system("sudo apt install -y build-essential libtool autoconf")
        os.system("sudo apt install clang")
    else:
        print("      Already installed.")


# Main Routine ---------------------------------------------------------------#
if __name__ == '__main__':
    hos = platform.system()
    if hos == 'Linux':
        install(hos)
    else:
        print(color.RED + "Error: Not supported OS" + color.END)
