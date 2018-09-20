#!/usr/bin/env python3
###############################################################################
#   @brief      Install and Configure devtools.
#   @author     llHoYall <hoya128@gmail.com>
#   @version    v1.0
#   @history
#       2018.01.18    Created.
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

    # neovim
    if hos == 'Windows':
        subprocess.Popen(["powershell.exe",
                          path + "\\neovim\\neovim_install.ps1"]).communicate()

    # vscode
    if hos == 'Windows':
        subprocess.Popen(['powershell.exe', path + '/vscode/vscode_install.ps1'])  \
                  .communicate()

    # xcode
    if hos == 'Darwin':
        xcode.install(hos)

    # clang
    if hos == 'Darwin' or hos == 'Linux':
        subprocess.Popen(['/bin/bash', path + '/clang/clang_install.sh']) \
                  .communicate()
    elif hos == 'Windows':
        subprocess.Popen(['powershell.exe', path + '/clang/clang_install.ps1'])  \
                  .communicate()

    # cmake
    if hos == 'Darwin' or hos == 'Linux':
        subprocess.Popen(['/bin/bash', path + '/cmake/cmake_install.sh']) \
                  .communicate()
    elif hos == 'Windows':
        subprocess.Popen(['powershell.exe', path + '/cmake/cmake_install.ps1'])  \
                  .communicate()

    # python
    if hos == 'Darwin' or hos == 'Linux':
        subprocess.Popen(['/bin/bash', path + '/python/python_install.sh']) \
                  .communicate()
    elif hos == 'Windows':
        subprocess.Popen(['powershell.exe', path + '/python/python_install.ps1'])  \
                  .communicate()

    # ruby
    if hos == 'Darwin' or hos == 'Linux':
        subprocess.Popen(['/bin/bash', path + '/ruby/ruby_install.sh']) \
                  .communicate()
    elif hos == 'Windows':
        subprocess.Popen(['powershell.exe', path + '/ruby/ruby_install.ps1'])  \
                  .communicate()

    # embedded
    if hos == 'Darwin' or hos == 'Linux':
        embedded.install(hos)

    # meld
    if hos == 'Darwin' or hos == 'Linux':
        subprocess.Popen(['/bin/bash', path + '/meld/meld_install.sh']) \
                  .communicate()
    elif hos == 'Windows':
        subprocess.Popen(["powershell.exe", path + "/meld/meld_install.ps1"])   \
                  .communicate()

    # web
    if hos == 'Windows':
        subprocess.Popen(["powershell.exe",
                          path + "\\web\\web_install.ps1"]).communicate()


# Config ---------------------------------------------------------------------#
def config(hos):
    print("==> Config " + color.BR_CYAN + "devtool" + color.END)

    # vscode
    if hos == 'Darwin':
        subprocess.Popen(['/bin/bash', path + '/vscode/vscode_config.sh']) \
                  .communicate()
    elif hos == 'Windows':
        subprocess.Popen(["powershell.exe", path + "/vscode/vscode_config.ps1"])  \
                  .communicate()

    # python
    if hos == 'Darwin' or hos == 'Linux':
        subprocess.Popen(['/bin/bash', path + '/python/python_config.sh']) \
                  .communicate()
    elif hos == 'Windows':
        subprocess.Popen(['powershell.exe', path + '/python/python_config.ps1'])  \
                  .communicate()
