"###############################################################################
"	HoYa's Vim Plugin - Snippet
"
"	author:		hoya128@gmail.com
"	version:	v1.0
"	note
"		2018.01.24 - First Created.
"###############################################################################

"	Makefile --------------------------------------------------------------------"
if has ("autocmd")
	au	FileType	makefile		nnoremap <buffer> <leader>/ I#<ESC>
endif
"------------------------------------------------------------------------------"

"	Vim -------------------------------------------------------------------------"
if has ("autocmd")
	au	FileType	vim					nnoremap <buffer> <leader>/	I"<ESC>
endif
"------------------------------------------------------------------------------"

"	C ---------------------------------------------------------------------------"
if has ("autocmd")
	au	FileType	c						nnoremap <buffer> <leader>/	I//<ESC>
endif
"------------------------------------------------------------------------------"