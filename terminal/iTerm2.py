###############################################################################
#   @file       iTerm2.py
#   @brief      This file installs and configures iterm2 program.
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
sys.path.append(os.path.dirname(os.path.abspath(os.path.dirname(__file__))))
from misc import color  # noqa


# Install --------------------------------------------------------------------#
def install(hos):
    print("  => Install " + color.ORANGE + "iTerm2" + color.END)
    if os.path.isdir("/Applications/iTerm.app"):
        print("     Already installed.")
    else:
        os.system("brew cask install iterm2")


# Main Routine ---------------------------------------------------------------#
if __name__ == '__main__':
    hos = platform.system()
    if hos == 'Darwin':
        install(hos)
    else:
        print(color.RED + "Error: Not supported OS" + color.END)
