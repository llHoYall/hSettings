#!/usr/bin/env python3
###############################################################################
#   @file       devtool/devtool.py
#   @brief      This file installs and configures devtools.
#   @author     llHoYall <hoya128@gmail.com>
#   @version    v1.0
#   @note
#       - 2018.01.18    Created.
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
    print("==> Install " + color.BR_CYAN + "devtool" + color.END)

    # xcode
    if hos == 'Darwin':
        xcode.install(hos)

    # clang
    if hos == 'Linux':
        clang.install(hos)

    # cmake
    if hos == 'Darwin' or hos == 'Linux':
        cmake.install(hos)

    # embedded
    if hos == 'Darwin' or hos == 'Linux':
        embedded.install(hos)

    # neovim
    if hos == 'Windows':
        subprocess.Popen(["powershell.exe",
                          path + "\\neovim\\neovim_install.ps1"]).communicate()


# Config ---------------------------------------------------------------------#
def config(hos):
    print("==> Config " + color.BR_CYAN + "devtool" + color.END)

    # vscode
    if hos == 'Windows':
        subprocess.Popen(["powershell.exe",
                          path + "\\vscode\\vscode_config.ps1"]).communicate()

    # neovim
