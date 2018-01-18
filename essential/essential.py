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
# User
sys.path.append(os.path.dirname(__file__))
sys.path.append(os.path.dirname(os.path.abspath(os.path.dirname(__file__))))
from misc import color  # noqa
import homebrew         # noqa


# Install --------------------------------------------------------------------#
def install(os):
    print("==> Install " + color.ORANGE + "essential" + color.END)
    if os == 'Darwin':
        # homebrew
        homebrew.install(os)
    else:
        print(color.RED + "    Error: Not supported tool" + color.END)
