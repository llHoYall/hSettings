###############################################################################
#   @file       color.py
#   @brief      This file is for colored terminal out.
#   @author     llHoYall <hoya128@gmail.com>
###############################################################################
#   @version    v1.0
#   @note
#       Color Palette is hSexy.
#       - 2018.01.05    Created.
###############################################################################

# Definition -----------------------------------------------------------------#
_ESCAPE_SEQUENCE = '\033['
_END = '0'
_BLACK = '30'
_RED = '31'
_GREEN = '32'
_YELLOW = '33'
_BLUE = '34'
_MAGENTA = '35'
_CYAN = '36'
_WHITE = '37'


# Set Color ------------------------------------------------------------------#
def setColor(bold, color):
    if bold:
        return _ESCAPE_SEQUENCE + '1;' + color + 'm'
    else:
        return _ESCAPE_SEQUENCE + color + 'm'


# for User -------------------------------------------------------------------#
BLACK = setColor(False, _BLACK)
BR_BLACK = setColor(True, _BLACK)
RED = setColor(False, _RED)
BR_RED = setColor(True, _RED)
GREEN = setColor(False, _GREEN)
BR_GREEN = setColor(True, _GREEN)
ORANGE = setColor(False, _YELLOW)
YELLOW = setColor(True, _YELLOW)
BLUE = setColor(False, _BLUE)
BR_BLUE = setColor(True, _BLUE)
MAGENTA = setColor(False, _MAGENTA)
BR_MAGENTA = setColor(True, _MAGENTA)
CYAN = setColor(False, _CYAN)
BR_CYAN = setColor(True, _CYAN)
WHITE = setColor(False, _WHITE)
BR_WHITE = setColor(True, _WHITE)
END = setColor(False, _END)
