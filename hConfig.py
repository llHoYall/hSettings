# Import Module --------------------------------------------------------------#
# Built-In
import platform
import sys
# HoYa
import color
import mac
import linux


# Usage ----------------------------------------------------------------------#
def usage():
    # print()
    print(color.DARK_GRAY + " Usage: " + color.END +
          color.ORANGE + "hConfig [opt]" + color.END)
    print()
    print(color.GREEN + "    opt" + color.END)
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
        print()
    else:
        usage()
        exit()

    if opt == 'h':
        usage()
        exit()

# Check OS -------------------------------------------------------------------#
os = platform.system()

# Configuration --------------------------------------------------------------#
print()
if os == 'Darwin':
    print("Install tools for MAC")
    mac.config(opt)
elif os == 'Linux':
    print("Install tools for Linux")
    linux.config(opt)
elif os == 'Windows':
    print("Install tools for Windows")
else:
    print(COLOR_RED + "Error: Not supported OS" + COLOR_END)
