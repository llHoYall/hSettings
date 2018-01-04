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
        os.system("/usr/bin/ruby -e '$(curl -fsSL   \
                  https://raw.githubusercontent.com/Homebrew/install/   \
                  master/install)'")
    else:
        print("      Already installed.")


# git ------------------------------------------------------------------------#
def _install_git():
    if os.system("git --version 1> /dev/null"):
        os.system("brew install git git-lfs")
    else:
        print("      Already installed.")


def _config_git():
    if os.system("git --version 1> /dev/null"):
        print("      Not installed.")
    else:
        scope = input("    - Input scope [" +
                      color.BOLD_BLUE + "G" + color.END + "lobal | " +
                      color.BOLD_BLUE + "L" + color.END + "ocal]: ")
        if scope !='G' and scope != 'L':
            print("      Wrong input.")
            return
        option = input("    - Input option [" +
                       color.BOLD_BLUE + "R" + color.END + "P | " +
                       color.BOLD_BLUE + "H" + color.END + "oYa]: ")
        if option != 'R' and option != 'H':
            print("      Wrong input.")
            return

        # Global Scope
        if scope == 'G':
            # user.name
            if option == 'R':
                os.system("git config --global user.name 'HoYa'")
            elif option == 'H':
                os.system("git config --global user.name 'llHoYall'")

            # user.email
            if option == 'R':
                os.system("git config --global user.email 'hoya@ixys.net'")
            elif option == 'H':
                os.system("git config --global user.email 'hoya128@gmail.com'")

            # color.ui
            os.system("git config --global color.ui auto")

            # core.autocrlf
            os.system("git config --global core.autocrlf input")

            # core.editor
            os.system("git config --global core.editor vim")

            # credential.helper
            os.system("git config --global credential.helper osxkeychain")

            # help.autocorrect
            os.system("git config --global help.autocorrect 1")

            # pull.rebase
            os.system("git config --global pull.rebase true")

            # push.default
            os.system("git config --global push.default simple")

            # rerere.enabled
            os.system("git config --global rerere.enabled true")

        # Local Scope
        elif scope == 'L':
            # user.name
            if option == 'R':
                os.system("git config --local user.name 'HoYa'")
            elif option == 'H':
                os.system("git config --local user.name 'llHoYall'")

            # user email
            if option == 'R':
                os.system("git config --local user.email 'hoya@ixys.net'")
            elif option == 'H':
                os.system("git config --local user.email 'hoya128@gmail.com'")


# Installation ---------------------------------------------------------------#
def _install_essential():
    print("==> Install " + color.YELLOW + "xcode" + color.END)
    _install_xcode()
    print("==> Install " + color.YELLOW + "homebrew" + color.END)
    _install_homebrew()


def _install_devtools(args):
    if "git" in args:
        print("==> Install " + color.YELLOW + "git" + color.END)
        _install_git()


# Configuration --------------------------------------------------------------#
def _config_devtools(args):
    if "git" in args:
        print("==> Configure " + color.YELLOW + "git" + color.END)
        _config_git()


# API ------------------------------------------------------------------------#
def config(opt, args):
    if opt == 'a':
        _install_essential()
        _install_devtools(args)
        _config_devtools(args)
    elif opt == 'i':
        _install_devtools(args)
    elif opt == 'c':
        _config_devtools(args)
