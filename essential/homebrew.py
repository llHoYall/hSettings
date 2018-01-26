###############################################################################
#   @file       homebrew.py
#   @brief      This file installs and configures homebrew program.
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
import shutil
# User
sys.path.append(os.path.dirname(os.path.abspath(os.path.dirname(__file__))))
from misc import color  # noqa


# Install --------------------------------------------------------------------#
def install(hos):
    print("  => Install " + color.ORANGE + "homebrew" + color.END)
    if shutil.which("brew") == None:
        os.system("/usr/bin/ruby -e '$(curl -fsSL   \
                  https://raw.githubusercontent.com/Homebrew/install/   \
                  master/install)'")
    else:
        print("     Already installed.")


# Main Routine ---------------------------------------------------------------#
if __name__ == '__main__':
    hos = platform.system()
    if hos == 'Darwin':
        install(hos)
    else:
        print(color.RED + "Error: Not supported OS" + color.END)
