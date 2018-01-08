###############################################################################
#   @file       git.py
#   @brief      This file installs and configures git program.
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
# User
sys.path.append(os.path.dirname(os.path.abspath(os.path.dirname(__file__))))
from misc import color

# Install --------------------------------------------------------------------#
def install_mac():
    if os.system("git --version 1> /dev/null"):
        os.system("brew install git git-lfs")
    else:
        print("      Already installed.")


# Config ---------------------------------------------------------------------#
def config_mac():
    if os.system("git --version 1> /dev/null"):
        print("      Not installed.")
    else:
        scope = input("    - Input scope [" +
                      color.BOLD_BLUE + "G" + color.END + "lobal | " +
                      color.BOLD_BLUE + "L" + color.END + "ocal]: ")
        if scope != 'G' and scope != 'L':
            print("      Wrong input.")
            return
        option = input("    - Input option [" +
                       color.BOLD_BLUE + "R" + color.END + "P | " +
                       color.BOLD_BLUE + "H" + color.END + "oYa]: ")
        if option != 'R' and option != 'H':
            print("      Wrong input.")
            return

        # Global Scope
        if scope == 'G':
            # user.name
            if option == 'R':
                os.system("git config --global user.name 'HoYa'")
            elif option == 'H':
                os.system("git config --global user.name 'llHoYall'")

            # user.email
            if option == 'R':
                os.system("git config --global user.email 'hoya@ixys.net'")
            elif option == 'H':
                os.system("git config --global user.email 'hoya128@gmail.com'")

            # color.ui
            os.system("git config --global color.ui auto")

            # core.autocrlf
            os.system("git config --global core.autocrlf input")

            # core.editor
            os.system("git config --global core.editor vim")

            # credential.helper
            os.system("git config --global credential.helper osxkeychain")

            # help.autocorrect
            os.system("git config --global help.autocorrect 1")

            # pull.rebase
            os.system("git config --global pull.rebase true")

            # push.default
            os.system("git config --global push.default simple")

            # rerere.enabled
            os.system("git config --global rerere.enabled true")

        # Local Scope
        elif scope == 'L':
            # user.name
            if option == 'R':
                os.system("git config --local user.name 'HoYa'")
            elif option == 'H':
                os.system("git config --local user.name 'llHoYall'")

            # user email
            if option == 'R':
                os.system("git config --local user.email 'hoya@ixys.net'")
            elif option == 'H':
                os.system("git config --local user.email 'hoya128@gmail.com'")
