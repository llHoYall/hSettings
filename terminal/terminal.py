###############################################################################
#   @file       terminal.py
#   @brief      This file installs and configures terminal program.
#   @author     llHoYall <hoya128@gmail.com>
###############################################################################
#   @version    v1.0
#   @note
#       - 2018.01.05    Created.
###############################################################################

# Import Module --------------------------------------------------------------#
# Built-In
import os
import sys
import platform
# User
sys.path.append(os.path.dirname(__file__))
sys.path.append(os.path.dirname(os.path.abspath(os.path.dirname(__file__))))
from misc import color  # noqa
import iTerm2           # noqa
import tmux             # noqa


# Install --------------------------------------------------------------------#
def install(hos):
    print("==> Install " + color.ORANGE + "terminal" + color.END)

    # iTerm2
    if hos == 'Darwin':
        iTerm2.install(hos)

    # tmux (tmuxinator)
    if hos == 'Darwin' or hos == 'Linux':
        tmux.install(hos)


# Config ---------------------------------------------------------------------#
def config(hos):
    print("==> Config " + color.ORANGE + "terminal" + color.END)

    # tmux
    if hos == 'Darwin' or hos == 'Linux':
        tmux.config(hos)


# Main Routine ---------------------------------------------------------------#
if __name__ == '__main__':
    hos = platform.system()
    install(hos)
    config(hos)
