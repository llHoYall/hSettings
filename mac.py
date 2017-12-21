# Import Module --------------------------------------------------------------#
import os


# Xcode ----------------------------------------------------------------------#
def config_essential():
    os.system("xcode-select -p")
    os.system("xcode-select --install")
