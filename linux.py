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
from essential import clang
from git import git


# Installation ---------------------------------------------------------------#
def _install_essential():
    print("==> Install " + color.ORANGE + "clang" + color.END)
    clang.install_linux()


def _install_devtools(args):
    if "git" in args:
        print("==> Install " + color.ORANGE + "git" + color.END)
        git.install_linux()


# Configuration --------------------------------------------------------------#
def _config_devtools(args):
    if "git" in args:
        print("==> Configure " + color.ORANGE + "git" + color.END)
        git.config_linux()


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
