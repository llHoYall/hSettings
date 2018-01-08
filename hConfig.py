###############################################################################
#   @file       hConfig.py
#   @brief      This file is for configuring my development environment.
#   @author     llHoYall <hoya128@gmail.com>
###############################################################################
#   @version    v1.0
#   @note
#       - 2018.01.05    Created.
###############################################################################

# Import Module --------------------------------------------------------------#
# Built-In
import platform
import sys
import ctypes
import subprocess
# User
from misc import color
import mac
import linux
import windows


# Usage ----------------------------------------------------------------------#
def usage():
    print()
    print(color.BOLD_WHITE + " Usage: " + color.END +
          color.ORANGE + "hConfig [opt] [tools]" + color.END)
    print()
    print(color.GREEN + "    opt" + color.END)
    print("    -a\tInstall and Configure. (Default)")
    print("    -i\tInstall only")
    print("    -c\tConfigure only")
    print("    -h\tHelp")
    print()
    print(color.GREEN + "    tools" + color.END)
    print("    git\t\tInstall, Configure")


# Check Argv -----------------------------------------------------------------#
argc = len(sys.argv)
opt = 'a'
if argc > 1:
    if sys.argv[1].startswith('-') and len(sys.argv[1]) == 2:
        opt = sys.argv[1][1]
        args = sys.argv[2:]
    else:
        args = sys.argv[1:]
else:
    args = ['git']

if opt == 'h' or (opt != 'a' and opt != 'i' and opt != 'c'):
    usage()
    exit()

# Check OS -------------------------------------------------------------------#
os = platform.system()

# Configuration --------------------------------------------------------------#
print()
if os == 'Darwin':
    if opt == 'i':
        print("Install tools for ", end='')
    elif opt == 'c':
        print("Configure tools for ", end='')
    else:
        print("Install & Configure tools for ", end='')
    print(color.MAGENTA + "MAC" +  color.END)
    mac.config(opt, args)
elif os == 'Linux':
    if opt == 'i':
        print("Install tools for ", end='')
    elif opt == 'c':
        print("Configure tools for ", end='')
    else:
        print("Install & Configure tools for ", end='')
    print(color.MAGENTA + "Linux" + color.END)
    linux.config(opt, args)
elif os == 'Windows':
    # Check run as administrator
    if ctypes.windll.shell32.IsUserAnAdmin() == 0:
        print("Must run as administrator")
        exit()

    # check powershell version
    if subprocess.run(['powershell', '$PSVersionTable.PSVersion.Major'],    \
                      stdout = subprocess.PIPE).stdout.decode('utf-8') < '5':
        print("Not supported powershell version")
        exit()

    if opt == 'i':
        print("Install tools for ", end='')
    elif opt == 'c':
        print("Configure tools for ", end='')
    else:
        print("Install & Configure tools for ", end='')
    print(color.MAGENTA + "Windows" + color.END)
    windows.config(opt, args)
else:
    print(color.RED + "Error: Not supported OS" + color.END)
