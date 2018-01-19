###############################################################################
#   @file       hConfig.py
#   @brief      This file is for configuring hoya's development environment.
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
from essential import essential
from git import git
from terminal import terminal
from shell import shell


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
    print("    essential\tInstall")
    print("    git\t\tInstall, Configure")
    print("    terminal\tInstall, Configure")
    print("    shell\tInstall, Configure")
    print("    devtool\tInstall")


# Install --------------------------------------------------------------------#
def install(hos, args):
    for arg in args:
        if "essential" == arg:
            essential.install(hos)
        elif "git" == arg:
            git.install(hos)
        elif "terminal" == arg:
            terminal.install(hos)
        elif "shell" == arg:
            shell.install(hos)
        else:
            print("==> Install " + color.ORANGE + arg + color.END)
            print(color.RED + "    Error: Not supported tool" + color.END)


# Config ---------------------------------------------------------------------#
def config(hos, args):
    for arg in args:
        if "git" == arg:
            git.config(hos)
        elif "terminal" == arg:
            terminal.config(hos)
        elif "shell" == arg:
            shell.config(hos)
        else:
            print("==> Configure " + color.ORANGE + arg + color.END)
            print(color.RED + "    Error: Not supported tool" + color.END)


# Check Argv -----------------------------------------------------------------#
argc = len(sys.argv)
opt = 'a'
if argc > 1:
    if sys.argv[1].startswith('-') and len(sys.argv[1]) == 2:
        opt = sys.argv[1][1]
        args = sys.argv[2:]
    else:
        args = sys.argv[1:]
if argc == 1 or opt == 'a':
    args = ['essential', 'git', 'terminal', 'shell', 'devtool']
if opt == 'h' or (opt != 'a' and opt != 'i' and opt != 'c'):
    usage()
    exit()

# Check OS -------------------------------------------------------------------#
hos = platform.system()
if hos != 'Darwin' and hos != 'Linux' and hos != 'Windows':
    print(color.RED + "Error: Not supported OS" + color.END)

if hos == 'Windows':
    # Check run as administrator
    if ctypes.windll.shell32.IsUserAnAdmin() == 0:
        print(color.RED + "Error: Must run as administrator" + color.END)
        exit()

    # check powershell version
    if subprocess.run(['powershell', '$PSVersionTable.PSVersion.Major'],
                      stdout=subprocess.PIPE).stdout.decode('utf-8') < '5':
        print(color.RED + "Error: Not supported powershell version"
              + color.END)
        exit()

# Configuration --------------------------------------------------------------#
print()
if opt == 'i':
    print("Install tools for ", end='')
elif opt == 'c':
    print("Configure tools for ", end='')
else:
    print("Install & Configure tools for ", end='')

if hos == 'Darwin':
    print(color.MAGENTA + "MAC" + color.END)
elif hos == 'Linux':
    print(color.MAGENTA + "Linux" + color.END)
else:
    print(color.MAGENTA + "Windows" + color.END)

if opt == 'i':
    install(hos, args)
elif opt == 'c':
    config(hos, args)
else:
    install(hos, args)
    config(hos, args)
