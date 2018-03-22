###############################################################################
#   @file       tmux.py
#   @brief      This file installs and configures tmux program.
#   @author     llHoYall <hoya128@gmail.com>
#   @version    v1.0
#   @note
#       - 2018.01.18    Created.
###############################################################################

# Import Module --------------------------------------------------------------#
# Built-In
import os
import sys
import platform
import pathlib
import shutil
# User
sys.path.append(os.path.dirname(os.path.abspath(os.path.dirname(__file__))))
from misc import color  # noqa


# Check installed tmux -------------------------------------------------------#
def _check_tmux(hos):
    if hos == 'Darwin' and hos == 'Linux':
        if os.system("which tmux 1> /dev/null"):
            return False
    elif hos == 'Windows':
        return False
    else:
        return True


def _check_tmuxinator(hos):
    if hos == 'Darwin' and hos == 'Linux':
        if os.system("which tmuxinator 1> /dev/null"):
            return False
    elif hos == 'Windows':
        return False
    else:
        return True


# Install --------------------------------------------------------------------#
def install(hos):
    # tmux
    print("  => Install " + color.ORANGE + "tmux" + color.END)
    if _check_tmux(hos):
        print("     Already installed.")
    else:
        _install_tmux(hos)

    # tmuxinator
    print("  => Install " + color.ORANGE + "tmuxinator" + color.END)
    if _check_tmuxinator(hos):
        print("     Already installed.")
    else:
        _install_tmuxinator(hos)


def _install_tmux(hos):
    if hos == 'Darwin':
        os.system("brew install tmux")
    elif hos == 'Linux':
        os.system("sudo apt install tmux")
    else:
        print(color.RED + "     Error: Not supported tool" + color.END)


def _install_tmuxinator(hos):
    if hos == 'Darwin':
        os.system("brew install ruby")
        os.system("gem install tmuxinator")
    elif hos == 'Linux':
        os.system("sudo apt install tmuxinator")
    else:
        print(color.RED + "     Error: Not supported tool" + color.END)


# Config ---------------------------------------------------------------------#
def config(hos):
    # tmux
    print("  => Config " + color.ORANGE + "tmux" + color.END)
    if _check_tmux(hos):
        _config_tmux(hos)
    else:
        print("     Not installed.")


def _config_tmux(hos):
    if hos == 'Darwin' or hos == 'Linux':
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
    else:
        print(color.RED + "     Error: Not supported tool" + color.END)


# Main Routine ---------------------------------------------------------------#
if __name__ == '__main__':
    hos = platform.system()
    install(hos)
    config(hos)
