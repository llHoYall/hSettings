#!/usr/bin/env python3
###############################################################################
#   @brief      Install and configure shell program.
#   @author     llHoYall <hoya128@gmail.com>
#   @version    v1.0
#   @history
#       2018.04.04    Created.
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
    print("==> Install " + color.BR_CYAN + "shell" + color.END)

    # zsh (oh-my-zsh)
    if hos == 'Darwin' or hos == 'Linux':
        subprocess.Popen(['/bin/bash', path + '/zsh/zsh_install.sh']) \
                  .communicate()

    # PowerShell
    if hos == 'Windows':
        subprocess.Popen(['powershell.exe',
                          path + '/powershell/powershell_install.ps1']) \
            .communicate()


# Config ---------------------------------------------------------------------#
def config(hos):
    print("==> Config " + color.BR_CYAN + "shell" + color.END)

    # zsh (oh-my-zsh)
    if hos == 'Darwin' or hos == 'Linux':
        subprocess.Popen(['/bin/bash', path + '/zsh/zsh_config.sh']) \
                  .communicate()

    # PowerShell
    if hos == 'Windows':
        subprocess.Popen(['powershell.exe',
                          path + '/powershell/powershell_config.ps1'])  \
            .communicate()
