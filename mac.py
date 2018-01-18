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
from essential import essential
from git import git
from terminal import terminal
from shell import shell
from devtool import devtool



# Installation ---------------------------------------------------------------#
def _install(args):
    for arg in args:
        if "essential" == arg:
            essential.install("m")
        elif "git" == arg:
            git.install("m")
        elif "terminal" == arg:
            terminal.install("m")
        elif "shell" == arg:
            shell.install("m")
        elif "devtool" == arg:
            devtool.install("m")
        else:
            print("==> Install " + color.ORANGE + arg + color.END)
            print("      Not supported tool")


# Configuration --------------------------------------------------------------#
def _config(args):
    for arg in args:
        if "git" == arg:
            git.config("m")
        elif "terminal" == arg:
            terminal.config("m")
        elif "shell" == arg:
            shell.config("m")
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
