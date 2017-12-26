# Import Module --------------------------------------------------------------#
import os
import color


# clang ----------------------------------------------------------------------#
def _install_clang():
    if os.system("clang -v 2> /dev/null"):
        os.system("sudo apt install clang")


# Configuration --------------------------------------------------------------#
def config_essential():
    print("==> Install " + color.YELLOW + "clang" + color.END)
    _install_clang()


def config(opt):
    if opt == 'a':
        config_essential()
