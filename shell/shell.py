###############################################################################
#   @file       shell.py
#   @brief      This file installs and configures shell program.
#   @author     llHoYall <hoya128@gmail.com>
###############################################################################
#   @version    v1.0
#   @note
#       - 2018.01.11    Created.
###############################################################################

# Import Module --------------------------------------------------------------#
# Built-In
import os
import sys
import platform
import subprocess
# User
sys.path.append(os.path.dirname(os.path.abspath(os.path.dirname(__file__))))
from misc import color  # noqa
import zsh              # noqa


# Install --------------------------------------------------------------------#
def install(hos):
    print("==> Install " + color.ORANGE + "shell" + color.END)

    # zsh
    if hos == 'Darwin' or hos == 'Linux':
        zsh.install(hos)


# Config ---------------------------------------------------------------------#
def config(hos):
    print("==> Config " + color.ORANGE + "shell" + color.END)

    # zsh
    if hos == 'Darwin' or hos == 'Linux':
        zsh.config(hos)


# Main Routine ---------------------------------------------------------------#
if __name__ == '__main__':
    hos = platform.system()
    install(hos)
    config(hos)
