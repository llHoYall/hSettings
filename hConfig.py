# Import Module --------------------------------------------------------------#
import platform
import sys
import mac

# Definition -----------------------------------------------------------------#
COLOR_BOLD = '\033[1m'
COLOR_RED = '\033[31m'
COLOR_GREEN = '\033[32m'
COLOR_END = '\033[0m'


# Usage ----------------------------------------------------------------------#
def usage():
    print()
    print(COLOR_BOLD + " Usage: " + COLOR_END +
          COLOR_RED + "hConfig [opt]" + COLOR_END)
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
if os == 'MAC':

# Main -----------------------------------------------------------------------#
usage()
