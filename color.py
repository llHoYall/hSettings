# Definition -----------------------------------------------------------------#
_ESCAPE_SEQUENCE = '\033['
_END = '0'
_BLACK = '30'
_RED = '31'
_GREEN = '32'
_ORANGE = '33'
_WHITE = '37'


# Set Color ------------------------------------------------------------------#
def setColor(bold, color):
    if bold:
        return _ESCAPE_SEQUENCE + '1;' + color + 'm'
    else:
        return _ESCAPE_SEQUENCE + color + 'm'


# for User -------------------------------------------------------------------#
BLACK = setColor(False, _BLACK)
BOLD_BLACK = setColor(True, _BLACK)
RED = setColor(False, _RED)
GREEN = setColor(False, _GREEN)
ORANGE = setColor(False, _ORANGE)
YELLOW = setColor(True, _ORANGE)
WHITE = setColor(False, _WHITE)
BOLD_WHITE = setColor(True, _WHITE)
END = setColor(False, _END)
