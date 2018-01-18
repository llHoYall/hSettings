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
import platform
# User
sys.path.append(os.path.dirname(os.path.abspath(os.path.dirname(__file__))))
from misc import color  # noqa


# Check installed git --------------------------------------------------------#
def _check(hos):
    if hos == 'Darwin' and hos == 'Linux':
        if os.system("which git 1> /dev/null"):
            return False
    elif hos == 'Windows':
        return False
    else:
        return True


# Install --------------------------------------------------------------------#
def install(hos):
    print("==> Install " + color.ORANGE + "git" + color.END)
    if _check(hos):
        print("    Already installed.")
    else:
        _install(hos)


def _install(hos):
    if hos == 'Darwin':
        os.system("brew install git git-lfs tig")
    elif hos == 'Linux':
        os.system("curl -s https://packagecloud.io/install/repositories/github/    \
                  git-lfs/script.deb.sh | sudo bash")
        os.system("sudo apt install git git-lfs tig")
    else:
        print(color.RED + "    Error: Not supported tool" + color.END)


# Config ---------------------------------------------------------------------#
def config(hos):
    print("==> Config " + color.ORANGE + "git" + color.END)
    if _check(hos):
        _config(hos)
    else:
        print("    Not installed.")


def _config(hos):
    if hos == 'Darwin' or hos == 'Linux':
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
            if hos == 'Darwin':
                os.system("git config --global credential.helper osxkeychain")
            elif hos == 'Linux':
                os.system("git config --global credential.helper store")

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
    else:
        print(color.RED + "    Error: Not supported tool" + color.END)


# Main Routine ---------------------------------------------------------------#
if __name__ == '__main__':
    hos = platform.system()
    install(hos)
    config(hos)
