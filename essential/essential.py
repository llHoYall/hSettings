###############################################################################
#   @file       essential.py
#   @brief      This file installs and configures essential program.
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
sys.path.append(os.path.dirname(__file__))
sys.path.append(os.path.dirname(os.path.abspath(os.path.dirname(__file__))))
from misc import color  # noqa
import homebrew         # noqa


# Install --------------------------------------------------------------------#
def install(hos):
    print("==> Install " + color.ORANGE + "essential" + color.END)

    # homebrew
    if hos == 'Darwin':
        homebrew.install(hos)


# Main Routine ---------------------------------------------------------------#
if __name__ == '__main__':
    hos = platform.system()
    install(hos)
