#!/usr/bin/env python3
###############################################################################
#   @file       git/git.py
#   @brief      This file installs and configures git program.
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


# Global Variables -----------------------------------------------------------#
path = os.path.dirname(__file__)


# Install --------------------------------------------------------------------#
def install(hos):
    print("==> Install " + color.BR_CYAN + "git" + color.END)

    if hos == 'Darwin' or hos == 'Linux':
        subprocess.Popen(["/bin/bash", path + '/git_install.sh']).communicate()
    elif hos == 'Windows':
        subprocess.Popen(["powershell.exe", path + "/git_install.ps1"])  \
                  .communicate()


# Config ---------------------------------------------------------------------#
def config(hos):
    print("==> Config " + color.BR_CYAN + "git" + color.END)

    if hos == 'Darwin' or hos == 'Linux':
        subprocess.Popen(["/bin/bash", path + '/git_config.sh']).communicate()
    elif hos == 'Windows':
        subprocess.Popen(["powershell.exe", path + "/git_config.ps1"])  \
                  .communicate()
