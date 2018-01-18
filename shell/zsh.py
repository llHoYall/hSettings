###############################################################################
#   @file       zsh.py
#   @brief      This file installs and configures zsh program.
#   @author     llHoYall <hoya128@gmail.com>
###############################################################################
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
def _check_zsh(hos):
    if hos == 'Darwin' and hos == 'Linux':
        if os.system("which zsh 1> /dev/null"):
            return False
    elif hos == 'Windows':
        return False
    else:
        return True


def _check_ohmyzsh(hos):
    dir = str(pathlib.Path.home()) + "/.oh-my-zsh"
    if hos == 'Darwin' and hos == 'Linux':
        if os.path.isdir(dir):
            return False
    elif hos == 'Windows':
        return False
    else:
        return True


# Install --------------------------------------------------------------------#
def install(hos):
    # zsh
    print("  => Install " + color.ORANGE + "zsh" + color.END)
    if _check_zsh(hos):
        print("     Already installed.")
    else:
        _install_zsh(hos)

    # oh-my-zsh
    print("  => Install " + color.ORANGE + "oh-my-zsh" + color.END)
    if _check_ohmyzsh(hos):
        print("     Already installed.")
    else:
        _install_ohmyzsh(hos)


def _install_zsh(hos):
    if hos == 'Darwin':
        os.system("brew install zsh zsh-completions")
    elif hos == 'Linux':
        os.system("sudo apt install zsh")
    else:
        print(color.RED + "     Error: Not supported tool" + color.END)
    os.system("chsh -s $(which zsh)")


def _install_ohmyzsh(hos):
    if hos == 'Darwin' or hos == 'Linux':
        os.system("curl -fsSL https\://raw.github.com/robbyrussell/"
                  "oh-my-zsh/master/tools/install.sh | sh")

        if hos == 'Linux':
            # zsh-completions plugin
            dir = str(pathlib.Path.home())
            dir += "/.oh-my-zsh/plugin/zsh-completions"
            if not os.path.isdir(dir):
                os.system("git clone https\://github.com/zsh-users/"
                          "zsh-completions ~/.oh-my-zsh/plugins/"
                          "zsh-completions")

        # zsh-syntax-highlighting plugin
        dir = str(pathlib.Path.home())
        dir += "/.oh-my-zsh/plugins/zsh-syntax-highlighting"
        if not os.path.isdir(dir):
            os.system("git clone https\://github.com/zsh-users/"
                      "zsh-syntax-highlighting ~/.oh-my-zsh/plugins/"
                      "zsh-syntax-highlighing")

        # zsh-autosuggestions plugin
        dir = str(pathlib.Path.home())
        dir += "/.oh-my-zsh/plugins/zsh-autosuggestions"
        if not os.path.isdir(dir):
            os.system("git clone https\://github.com/zsh-users/"
                      "zsh-autosuggestions ~/.oh-my-zsh/plugins/"
                      "zsh-autosuggestions")
    else:
        print(color.RED + "     Error: Not supported tool" + color.END)


# Config ---------------------------------------------------------------------#
def config(hos):
    # zsh
    print("  => Config " + color.ORANGE + "zsh" + color.END)
    if _check_zsh(hos):
        _config_zsh(hos)
    else:
        print("     Not installed.")

    # oh-my-zsh
    print("  => Config " + color.ORANGE + "oh-my-zsh" + color.END)
    if _check_ohmyzsh(hos):
        _config_ohmyzsh(hos)
    else:
        print("     Not installed.")


def _config_zsh(hos):
    if hos == 'Darwin' or hos == 'Linux':
        src = os.path.dirname(os.path.realpath(__file__)) + "/.zshrc"
        dst = str(pathlib.Path.home())
        if os.path.isfile(src):
            shutil.copy2(src, dst)


def _config_ohmyzsh(hos):
    if hos == 'Darwin' or hos == 'Linux':
        src = os.path.dirname(os.path.realpath(__file__)) + "/hoya.zsh-theme"
        dst = str(pathlib.Path.home()) + "/.oh-my-zsh/themes"
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
