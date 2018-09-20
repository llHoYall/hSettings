#!/usr/bin/env python3
###############################################################################
#   @brief      Install and configure essential program.
#   @author     llHoYall <hoya128@gmail.com>
#   @version    v1.0
#   @history
#       2018.01.05    Created.
###############################################################################

# Import Module --------------------------------------------------------------#
# Built-In
import os
import sys
import subprocess
# User
sys.path.append(os.path.dirname(os.path.abspath(os.path.dirname(__file__))))
from misc import color  # noqa

# Global Vairables -----------------------------------------------------------#
path = os.path.dirname(__file__)


# Install --------------------------------------------------------------------#
def install(hos):
    print("==> Install " + color.BR_CYAN + "essential" + color.END)

    # Mac - homebrew
    if hos == 'Darwin':
        subprocess.Popen(["/bin/bash", path + '/mac/homebrew_install.sh'])  \
                  .communicate()

    # Linux
    if hos == 'Linux':
        subprocess.Popen(["/bin/bash", path + '/linux/build-essential_install.sh'])  \
                  .communicate()

    # Windows - chocolatey
    if hos == 'Windows':
        subprocess.Popen(["powershell.exe",
                          path + "\windows\chocolatey_install.ps1"]).communicate()


# Config ---------------------------------------------------------------------#
def config(hos):
    print("==> Config " + color.BR_CYAN + "essential" + color.END)
