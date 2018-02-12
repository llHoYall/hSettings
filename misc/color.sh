#!/bin/bash

# Definitions -----------------------------------------------------------------#
_START='\033['
_RESET='0'
_BOLD='1'
_FG_BLACK='30'
_FG_RED='31'
_FG_GREEN='32'
_FG_YELLOW='33'
_FG_BLUE='34'
_FG_MAGENTA='35'
_FG_CYAN='36'
_FG_WHITE='37'
_BG_BLACK='40'
_BG_RED='41'
_BG_GREEN='42'
_BG_YELLOW='43'
_BG_BLUE='44'
_BG_MAGENTA='45'
_BG_CYAN='46'
_BG_WHITE='47'
_END='m'

# Make Color ------------------------------------------------------------------#
RED=$_START$_FG_RED$_END
GREEN=$_START$_FG_GREEN$_END
YELLOW=$_START$_FG_YELLOW$_END
BR_YELLOW=$_START$_BOLD';'$_FG_YELLOW$_END
BR_WHITE=$_START$_BOLD';'$_FG_WHITE$_END
END=$_START$_RESET$_END
