"###############################################################################
"	HoYa's Vim Plugin - Filetype
"
"	author:		hoya128@gmail.com
"	version:	v1.0
"	note
"		2017.10.26 - First Created.
"###############################################################################

"	Python ----------------------------------------------------------------------"
se		sua+=.py
if has ("autocmd")
	au	FileType	python	setl et sts=4 sw=4 ts=4
endif
"------------------------------------------------------------------------------"