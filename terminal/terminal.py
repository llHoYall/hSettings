###############################################################################
#   @file       terminal.py
#   @brief      This file installs and configures terminal program.
#   @author     llHoYall <hoya128@gmail.com>
###############################################################################
#   @version    v1.0
#   @note
#       - 2018.01.05    Created.
#                       MAC - iterm2
###############################################################################

# Import Module --------------------------------------------------------------#
# Built-In
import os
import sys
import shutil
import pathlib
# User
sys.path.append(os.path.dirname(os.path.abspath(os.path.dirname(__file__))))
from misc import color  # noqa


# Install --------------------------------------------------------------------#
def install_mac():
    # iTerm2
    print("  => Install " + color.ORANGE + "iTerm2" + color.END)
    if os.path.isdir("/Applications/iTerm.app"):
        print("        Already installed.")
    else:
        os.system("brew cask install iterm2")

    # tmux
    print("  => Install " + color.ORANGE + "tmux" + color.END)
    if os.system("which tmux 1> /dev/null"):
        os.system("brew install tmux")
    else:
        print("        Already installed.")

    # tmuxinator
    print("  => Install " + color.ORANGE + "tmuxinator" + color.END)
    if os.system("which tmuxinator 1> /dev/null"):
        os.system("brew install ruby")
        os.system("gem install tmuxinator")
    else:
        print("        Already installed.")


# Config ---------------------------------------------------------------------#
def config_mac():
    # tmux
    print("  => Configure " + color.ORANGE + "tmux" + color.END)
    if os.system("which tmux 1> /dev/null"):
        print("      Not installed.")
    else:
        src = os.path.dirname(os.path.realpath(__file__)) + "/.tmux.conf"
        dst = str(pathlib.Path.home())
        if os.path.isfile(src):
            shutil.copy2(src, dst)

        src = os.path.dirname(os.path.realpath(__file__)) + "/get-uptime.sh"
        dst = str(pathlib.Path.home()) + "/.tmux"
        if os.path.isfile(src):
            if not os.path.exists(dst):
                os.makedirs(dst)
            shutil.copy2(src, dst)
