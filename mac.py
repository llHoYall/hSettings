###############################################################################
#   @file       mac.py
#   @brief      This file is for installation and configuration program on MAC.
#   @author     llHoYall <hoya128@gmail.com>
###############################################################################
#   @version    v1.0
#   @note
#       - 2018.01.05    Created.
###############################################################################

# Import Module --------------------------------------------------------------#
# Built-In
import os
# User
from misc import color
from essential import xcode
from essential import homebrew
from git import git


# Installation ---------------------------------------------------------------#
def _install_essential():
    print("==> Install " + color.YELLOW + "xcode" + color.END)
    xcode.install_mac()
    print("==> Install " + color.YELLOW + "homebrew" + color.END)
    homebrew.install_mac()


def _install_devtools(args):
    if "git" in args:
        print("==> Install " + color.YELLOW + "git" + color.END)
        git.install_mac()


# Configuration --------------------------------------------------------------#
def _config_devtools(args):
    if "git" in args:
        print("==> Configure " + color.YELLOW + "git" + color.END)
        git.config_mac()


# API ------------------------------------------------------------------------#
def config(opt, args):
    if opt == 'a':
        _install_essential()
        _install_devtools(args)
        _config_devtools(args)
    elif opt == 'i':
        _install_devtools(args)
    elif opt == 'c':
        _config_devtools(args)
