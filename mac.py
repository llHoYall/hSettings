# Import Module --------------------------------------------------------------#
import os
import color


# Xcode ----------------------------------------------------------------------#
def _install_xcode():
    if os.system("xcode-select -p 1> /dev/null"):
        os.system("xcode-select --install")
    else:
        print("      Already installed.")


# Homebrew -------------------------------------------------------------------#
def _install_homebrew():
    if os.system("brew -v 1> /dev/null"):
        os.system('/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"')
    else:
        print("      Already installed.")

# Configuration --------------------------------------------------------------#
def config_essential():
    print("==> Install " + color.YELLOW + "xcode" + color.END)
    _install_xcode()
    print("==> Install " + color.YELLOW + "homebrew" + color.END)
    _install_homebrew()


def config(opt):
    if opt == 'a':
        config_essential()
