# Import Module --------------------------------------------------------------#
import os
import color


# Xcode ----------------------------------------------------------------------#
def _install_xcode():
    if os.system("xcode-select -p 1> /dev/null"):
        os.system("xcode-select --install")
    else:
        print("      Already installed.")


# Configuration --------------------------------------------------------------#
def config_essential():
    print("==> Install " + color.YELLOW + "xcode" + color.END)
    _install_xcode()


def config(opt):
    if opt == 'a':
        config_essential()
