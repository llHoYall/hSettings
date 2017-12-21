# Import Module --------------------------------------------------------------#
import platform
import sys
import mac
import linux

# Definition -----------------------------------------------------------------#
COLOR_BOLD = '\033[1m'
COLOR_RED = '\033[31m'
COLOR_GREEN = '\033[32m'
COLOR_ORANGE = '\033[33m'
COLOR_END = '\033[0m'


# Usage ----------------------------------------------------------------------#
def usage():
    print()
    print(COLOR_BOLD + " Usage: " + COLOR_END +
          COLOR_ORANGE + "hConfig [opt]" + COLOR_END)
    print()
    print(COLOR_GREEN + "    opt" + COLOR_END)
    print("    -a\tInstall and Configure. (Default)")
    print("    -i\tInstall only")
    print("    -c\tConfigure only")
    print("    -h\tHelp")


# Check Argv -----------------------------------------------------------------#
argc = len(sys.argv)
opt = 'a'
if argc > 1:
    if sys.argv[1].startswith('-') and len(sys.argv[1]) == 2:
        opt = sys.argv[1][1]
    else:
        usage()
        exit()

# Check OS -------------------------------------------------------------------#
os = platform.system()

# Configuration --------------------------------------------------------------#
print()
if os == 'MAC':
    print("Install tools for MAC")
elif os == 'Linux':
    print("Install tools for Linux")
    linux.config(opt)
elif os == 'Windows':
    print("Install tools for Windows")
else:
    print(COLOR_RED + "Error: Not supported OS" + COLOR_END)
