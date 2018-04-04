#!/usr/bin/env python3
###############################################################################
#   @file       terminal/terminal.py
#   @brief      This file installs and configures terminal program.
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
    print("==> Install " + color.BR_CYAN + "terminal" + color.END)

    # iTerm2
    if hos == 'Darwin':
        subprocess.Popen(['/bin/bash', path + '/iTerm2_install.sh']) \
                  .communicate()

    # tmux (tmuxinator)
    if hos == 'Darwin' or hos == 'Linux':
        subprocess.Popen(['/bin/bash', path + '/tmux_install.sh']) \
                  .communicate()

    # ConEmu
    if hos == 'Windows':
        subprocess.Popen(['powershell.exe', path + '/conemu_install.ps1'])   \
                  .communicate()

    # WSL (Windows Subsystems for Linux)
    if hos == 'Windows':
        subprocess.Popen(['powershell.exe', path + '/wsl_install.ps1'])   \
                  .communicate()

    # putty
    if hos == 'Windows':
        subprocess.Popen(['powershell.exe', path + '/putty_install.ps1'])   \
                  .communicate()


# Config ---------------------------------------------------------------------#
def config(hos):
    print("==> Config " + color.BR_CYAN + "terminal" + color.END)

    # tmux
    if hos == 'Darwin' or hos == 'Linux':
        subprocess.Popen(['/bin/bash', path + '/tmux_config.sh'])  \
                  .communicate()

    # ConEmu
    if hos == 'Windows':
        subprocess.Popen(['powershell.exe', path + '/conemu_config.ps1'])   \
                  .communicate()

    # WSL (Windows Subsystems for Linux)
    if hos == 'Windows':
        subprocess.Popen(['powershell.exe', path + '/wsl_config.ps1'])   \
                  .communicate()

    # putty
    if hos == 'Windows':
        subprocess.Popen(['powershell.exe', path + '/putty_config.ps1'])    \
                  .communicate()
