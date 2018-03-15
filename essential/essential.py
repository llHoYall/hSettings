###############################################################################
#   @file       essential.py
#   @brief      This file installs and configures essential program.
#   @author     llHoYall <hoya128@gmail.com>
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


# Global Vairables -----------------------------------------------------------#
path = os.path.dirname(__file__)


# Install --------------------------------------------------------------------#
def install(hos):
    print("==> Install " + color.BR_CYAN + "essential" + color.END)

    # homebrew
    if hos == 'Darwin':
        os.system(path + "/homebrew_install.sh ")


# Config ---------------------------------------------------------------------#
def config(hos):
    print("==> Config " + color.ORANGE + "essential" + color.END)
