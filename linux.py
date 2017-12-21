# Import Module --------------------------------------------------------------#
import os

# Definition -----------------------------------------------------------------#
COLOR_YELLOW = '\033[93m'
COLOR_END = '\033[0m'


# clang ----------------------------------------------------------------------#
def _install_clang():
    if os.system("clang -v 2> /dev/null"):
        os.system("sudo apt install clang")


# Configuration --------------------------------------------------------------#
def config_essential():
    print("==> Install " + COLOR_YELLOW + "clang" + COLOR_END)
    _install_clang()


def config(opt):
    if opt == 'a':
        config_essential()
