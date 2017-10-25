"###############################################################################
"	HoYa's Vim Plugin - Miscellaneous
"
"	author:		hoya128@gmail.com
"	version:	v1.0
"	note
"		2017.10.25 - First Created.
"###############################################################################

"Show Trailing Whitespace -----------------------------------------------------"
hi	BadWhitespace ctermbg=red		guibg=red
match	BadWhitespace	/^\t\+/
match BadWhitespace	/\s\+$/
"------------------------------------------------------------------------------"
