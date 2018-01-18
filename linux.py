###############################################################################
#   @file       linux.py
#   @brief      This file is for instsallation and configuration program on
#               linux.
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
from git import git
from terminal import terminal
from shell import shell
from devtool import devtool


# Installation ---------------------------------------------------------------#
def _install(args):
    for arg in args:
        if "git" == arg:
            git.install("l")
        elif "terminal" == arg:
            terminal.install("l")
        elif "shell" == arg:
            shell.install("l")
        elif "devtool" == arg:
            devtool.install("l")
        else:
            print("==> Install " + color.ORANGE + arg + color.END)
            print("      Not supported tool")


# Configuration --------------------------------------------------------------#
def _config(args):
    for arg in args:
        if "git" == arg:
            git.config("l")
        elif "terminal" == arg:
            terminal.config("l")
        elif "shell" == arg:
            shell.config("l")
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
