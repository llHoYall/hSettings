"###############################################################################
"	HoYa's Vim Plugin - Miscellaneous
"
"	author:		hoya128@gmail.com
"	version:	v1.0
"	note
"		2017.10.25 - First Created.
"###############################################################################
"
" Usage
"		,f	Folding
"		\l	Show <TAB>, <EOL>
"
"###############################################################################

" Move Line -------------------------------------------------------------------"
nnoremap	<S-Up>		ddkP
nnoremap	<S-Down>	ddp
"------------------------------------------------------------------------------"

" Backspace -------------------------------------------------------------------"
nnoremap	<BS>		X
"------------------------------------------------------------------------------"

" To Lower/Upper Case ---------------------------------------------------------"
nnoremap	<leader>u		viwUe
inoremap	<leader>u		<ESC>viwUea
nnoremap	<leader>l		viwue
inoremap	<leader>l		<ESC>viwuea
"------------------------------------------------------------------------------"

"	Show Invisible Character ----------------------------------------------------"
se		lcs=tab:▸\ ,eol:¬
nmap	<leader>z		:set list!<CR>
"------------------------------------------------------------------------------"

"	Show Trailing Whitespace ----------------------------------------------------"
hi	BadWhitespace ctermbg=Red		guibg=Red
mat	BadWhitespace	/^\t\+/
mat	BadWhitespace	/\s\+$/
"------------------------------------------------------------------------------"

" Remove Trailing Whitespace --------------------------------------------------"
fu! Preserve(command)
	let _s=@/
	let l = line(".")
	let c = col(".")
	execute a:command
	let @/=_s
	call cursor(l, c)
endf

au	BufWritePre	*	call Preserve("%s/\\s\\+$//e")
"------------------------------------------------------------------------------"
