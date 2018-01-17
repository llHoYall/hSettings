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
from terminal import terminal
from shell import shell


# Installation ---------------------------------------------------------------#
def _install(args):
    for arg in args:
        if "essential" == arg:
            print("==> Install " + color.ORANGE + "xcode" + color.END)
            xcode.install_mac()
            print("==> Install " + color.ORANGE + "homebrew" + color.END)
            homebrew.install_mac()
        elif "git" == arg:
            print("==> Install " + color.ORANGE + "git" + color.END)
            git.install_mac()
        elif "terminal" == arg:
            print("==> Install " + color.ORANGE + "terminal" + color.END)
            terminal.install_mac()
        elif "shell" == arg:
            print("==> Install " + color.ORANGE + "shell" + color.END)
            shell.install_mac()
        else:
            print("==> Install " + color.ORANGE + arg + color.END)
            print("      Not supported tool")


# Configuration --------------------------------------------------------------#
def _config(args):
    for arg in args:
        if "git" == arg:
            print("==> Configure " + color.ORANGE + "git" + color.END)
            git.config_mac()
        elif "terminal" == arg:
            print("==> Configure " + color.ORANGE + "terminal" + color.END)
            terminal.config_mac()
        elif "shell" == arg:
            print("==> Configure " + color.ORANGE + "shell" + color.END)
            shell.config_mac()
        else:
            print("==> Configure " + color.ORANGE + arg + color.END)
            print("      Not supported tool")


# API ------------------------------------------------------------------------#
def config(opt, args):
    if opt == 'a':
        _install(args)
        _config(args)
    elif opt == 'i':
        _install(args)
    elif opt == 'c':
        _config(args)
