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
def _install_essential(args):
    if "essential" in args:
        print("==> Install " + color.ORANGE + "xcode" + color.END)
        xcode.install_mac()
        print("==> Install " + color.ORANGE + "homebrew" + color.END)
        homebrew.install_mac()


def _install_devtools(args):
    if "git" in args:
        print("==> Install " + color.ORANGE + "git" + color.END)
        git.install_mac()


def _install_devenv(args):
    if "terminal" in args:
        print("==> Install " + color.ORANGE + "terminal" + color.END)
        terminal.install_mac()
    if "shell" in args:
        print("==> Install " + color.ORANGE + "shell" + color.END)
        shell.install_mac()


# Configuration --------------------------------------------------------------#
def _config_devtools(args):
    if "git" in args:
        print("==> Configure " + color.ORANGE + "git" + color.END)
        git.config_mac()


def _config_devenv(args):
    if "terminal" in args:
        print("==> Configure " + color.ORANGE + "terminal" + color.END)
        terminal.config_mac()
    if "shell" in args:
        print("==> Configure " + color.ORANGE + "shell" + color.END)
        shell.config_mac()


# API ------------------------------------------------------------------------#
def config(opt, args):
    if opt == 'a':
        _install_essential(args)
        _install_devtools(args)
        _install_devenv(args)
        _config_devtools(args)
    elif opt == 'i':
        _install_essential(args)
        _install_devtools(args)
        _install_devenv(args)
    elif opt == 'c':
        _config_devtools(args)
        _config_devenv(args)
