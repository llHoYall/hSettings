"###############################################################################
"	HoYa's Vim Plugin - Statusline
"
"	author:		hoya128@gmail.com
"	version:	v1.0
"	note
"		2017.10.27 - First Created.
"###############################################################################

" Statusline Configuration ----------------------------------------------------"
se		sts=2
se		stl=%n%#cursorcolumn#\ %m%r%F%=
se		stl+=%P%%\ %l:%v\ %y\[%{&fileformat}\]\[%{&fileencoding}\]
"------------------------------------------------------------------------------"

"	Plugin: Vim-Airline Configuraion --------------------------------------------"
let g:airline_theme='wombat'
let g:airline_symbols_ascii=1
let g:airline#extensions#tabline#enabled=1
"------------------------------------------------------------------------------"
