###############################################################################
#   @file       shell.py
#   @brief      This file installs and configures shell program.
#   @author     llHoYall <hoya128@gmail.com>
###############################################################################
#   @version    v1.0
#   @note
#       - 2018.01.11    Created.
###############################################################################

# Import Module --------------------------------------------------------------#
# Built-In
import os
import sys
import shutil
import pathlib
import subprocess
# User
sys.path.append(os.path.dirname(os.path.abspath(os.path.dirname(__file__))))
from misc import color  # noqa


# Install --------------------------------------------------------------------#
def install_mac():
    # zsh
    print("  => Install " + color.ORANGE + "zsh" + color.END)
    if os.system("which zsh 1> /dev/null"):
        os.system("brew install zsh zsh-completions")
        os.system("chsh -s $(which zsh)")
    else:
        print("       Already installed.")

    # oh-my-zsh
    print("  => Install " + color.ORANGE + "oh-my-zsh" + color.END)
    dir = str(pathlib.Path.home()) + "/.oh-my-zsh"
    if os.path.isdir(dir):
        os.system("curl -fsSL https\://raw.github.com/robbyrussell/"
                  "oh-my-zsh/master/tools/install.sh | sh")

        # zsh-syntax-highlighting plugin
        dir = str(pathlib.Path.home())
        dir += "/.oh-my-zsh/plugins/zsh-syntax-highlighting"
        if not os.path.isdir(dir):
            os.system("git clone https\://github.com/zsh-users/"
                      "zsh-syntax-highlighting ~/.oh-my-zsh/plugins/"
                      "zsh-syntax-highlighting")

        # zsh-autosuggestions plugin
        dir = str(pathlib.Path.home())
        dir += "/.oh-my-zsh/plugins/zsh-autosuggestions"
        if not os.path.isdir(dir):
            os.system("git clone https\://github.com/zsh-users/"
                      "zsh-autosuggestions ~/.oh-my-zsh/plugins/"
                      "zsh-autosuggestions")
    else:
        print("       Already installed.")


def install_linux():
    # zsh
    print("  => Install " + color.ORANGE + "zsh" + color.END)
    if os.system("which zsh 1> /dev/null"):
        os.system("sudo apt install zsh")
        os.system("chsh -s $(which zsh)")
    else:
        print("       Already installed.")

    # oh-my-zsh
    print("  => Install " + color.ORANGE + "oh-my-zsh" + color.END)
    dir = str(pathlib.Path.home()) + "/.oh-my-zsh"
    if not os.path.isdir(dir):
        os.system("curl -fsSL https\://raw.github.com/robbyrussell/"
                  "oh-my-zsh/master/tools/insstall.sh | sh")

        # zsh-completions plugin
        dir = str(pathlib.Path.home()) + "/.oh-my-zsh/plugins/zsh-completions"
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
                      "zsh-syntax-highlighting")

        # zsh-autosuggestions plugin
        dir = str(pathlib.Path.home())
        dir += "/.oh-my-zsh/plugins/zsh-autosuggestions"
        if not os.path.isdir(dir):
            os.system("git clone https\://github.com/zsh-users/"
                      "zsh-autosuggestions ~/.oh-my-zsh/plugins/"
                      "zsh-autosuggestions")
    else:
        print("       Already installed.")


# Config ---------------------------------------------------------------------#
def config_mac():
    # zsh
    print("  => Configure " + color.ORANGE + "zsh" + color.END)
    if os.system("which zsh 1> /dev/null"):
        print("       Not installed.")
    else:
        src = os.path.dirname(os.path.realpath(__file__)) + "/.zshrc"
        dst = str(pathlib.Path.home())
        if os.path.isfile(src):
            shutil.copy2(src, dst)

    # oh-my-zsh
    print("  => Configure " + color.ORANGE + "oh-my-zsh" + color.END)
    dir = str(pathlib.Path.home()) + "/.oh-my-zsh"
    if os.path.isdir(dir):
        src = os.path.dirname(os.path.realpath(__file__)) + "/hoya.zsh-theme"
        dst = str(pathlib.Path.home()) + "/.oh-my-zsh/themes"
        if os.path.isfile(src):
            shutil.copy2(src, dst)
    else:
        print("       Not installed.")

    print("You must type " + color.GREEN + "'source ~/.zshrc'" + color.END +
          " to apply configuration.")


def config_linux():
    # zsh
    print("  => Configure " + color.ORANGE + "zsh" + color.END)
    if os.system("which zsh 1> /dev/null"):
        print("       Not installed.")
    else:
        src = os.path.dirname(os.path.realpath(__file__)) + "/.zshrc"
        dst = str(pathlib.Path.home())
        if os.path.isfile(src):
            shutil.copy2(src, dst)

    # oh-my-zsh
    print("  => Configure " + color.ORANGE + "oh-my-zsh" + color.END)
    dir = str(pathlib.Path.home()) + "/.oh-my-zsh"
    if os.path.isdir(dir):
        src = os.path.dirname(os.path.realpath(__file__)) + "/hoya.zsh-theme"
        dst = str(pathlib.Path.home()) + "/.oh-my-zsh/themes"
        if os.path.isfile(src):
            shutil.copy2(src, dst)
    else:
        print("       Not installed.")

    print("You must type " + color.GREEN + "'source ~/.zshrc'" + color.END +
          " to apply configuration.")
