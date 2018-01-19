###############################################################################
#   @file       xcode.py
#   @brief      This file installs and configures xcode program.
#   @author     llHoYall <hoya128@gmail.com>
###############################################################################
#   @version    v1.0
#   @note
#       - 2018.01.05    Created.
###############################################################################

# Import Module --------------------------------------------------------------#
# Built-In
import os
import sys
import platform
# User
sys.path.append(os.path.dirname(os.path.abspath(os.path.dirname(__file__))))
from misc import color  # noqa


# Install --------------------------------------------------------------------#
def install(hos):
    print("  => Install " + color.ORANGE + "xcode" + color.END)
    if os.system("xcode-select -p 1> /dev/null"):
        os.system("xcode-select --install")
    else:
        print("     Already installed.")


# Main Routine ---------------------------------------------------------------#
if __name__ == '__main__':
    hos = platform.system()
    if hos == 'Darwin':
        install(hos)
    else:
        print(color.RED + "Error: Not supported OS" + color.END)
