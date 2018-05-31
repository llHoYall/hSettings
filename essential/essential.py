#!/usr/bin/env python3
###############################################################################
#   @file       essential/essential.py
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
import subprocess
# User
sys.path.append(os.path.dirname(os.path.abspath(os.path.dirname(__file__))))
from misc import color  # noqa

# Global Vairables -----------------------------------------------------------#
path = os.path.dirname(__file__)


# Install --------------------------------------------------------------------#
def install(hos):
    print("==> Install " + color.BR_CYAN + "essential" + color.END)

    # homebrew
    if hos == 'Darwin':
        subprocess.Popen(["/bin/bash", path + '/homebrew_install.sh'])  \
                  .communicate()

    # chocolatey
    if hos == 'Windows':
        subprocess.Popen(["powershell.exe",
                          path + "\chocolatey_install.ps1"]).communicate()


# Config ---------------------------------------------------------------------#
def config(hos):
    print("==> Config " + color.BR_CYAN + "essential" + color.END)
