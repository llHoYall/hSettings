"===============================================================================
" HoYa's Vim Configuration
" 
" author:   hoya128@gmail.com
" version:  v1.1
" date:     2016.06.30
"===============================================================================

set fenc=utf-8
set fencs=ucs-bom,korea
set ff=unix

syntax on
filetype on
colo HoYa 								" color scheme

set nocompatible	" No compatible with Vi. Only use Vim.

set ai		        								" auto indent
set backspace=start,indent,eol		" allow backspacing
set cin           								" C-stype indent (cindent)
set cc=80         								" show print margin
set hlsearch
set nu				 								   	" show line number
set ruler													" show cursor position
set sm		        								" show match
set si		        								" smart indent
set statusline=\%<%l:%v\[%P]%=%a\%h%m%r\%F\ 
set sw=2          								" shift width
set ts=2          								" tab stop

" https://github.com/scrooloose/nerdtree
set rtp+=~/.vim/nerdtree					" run-time path for NERDTree plugin
" https://sourceforge.net/projects/vim-taglist/files
set rtp+=~/.vim/taglist
" https://github.com/wesleyche/SrcExpl
set rtp+=~/.vim/srcexpl

" Map --------------------------------------------------------------------------
map <F2>	:NERDTreeToggle<CR>		
map <F3>	:TlistToggle<CR>
map <F4>	:SrcExplToggle<CR><CR>

map ,f		v]}zf				" folding
map ,1 		:b!1<CR>		" Move to buffer #1
map ,2 		:b!2<CR>		" Move to buffer #2
map ,3 		:b!3<CR>		" Move to buffer #3
map ,4 		:b!4<CR>		" Move to buffer #4
map ,5 		:b!5<CR>		" Move to buffer #5
map ,6 		:b!6<CR>		" Move to buffer #6
map ,7 		:b!7<CR>		" Move to buffer #7
map ,8 		:b!8<CR>		" Move to buffer #8
map ,9 		:b!9<CR>		" Move to buffer #9
map ,0 		:b!10<CR>		" Move to buffer #10
map ,x 		:bn!<CR>		" Move to next buffer
map ,z 		:bp!<CR>		" Move to previous buffer
map ,w 		:bw<CR>			" Current buffer wipeout


" ctags ------------------------------------------------------------------------
set tags+=./tags

if version >= 500
	func! Sts()
		let symbol = expand("<cword>")
		exe "sts ".symbol
	endfunc

	func! Tj()
		let symbol = expand("<cword>")
		exe "tj ".symbol
	endfunc
endif

nmap ,st :call Sts()<CR>
nmap ,tj :call Tj()<CR>


" cscope -----------------------------------------------------------------------
set csprg=/usr/local/bin/cscope			" bin location
set nocsverb												" verbose off
cs add ./cscope.out
set csverb													" verbose on
set csto=0													" cscope DB search first
set cst															" cscope DB tag DB search

func! Css()
	let symbol = expand("<cword>")
	new
	exe "cs find s ".symbol
	if getline(1) == ""
		exe "q!"
	endif
endfunc

func! Csg()
	let symbol = expand("<cword>")
	new
	exe "cs find g ".symbol
	if getline(1) == ""
		exe "q!"
	endif
endfunc

func! Csd()
	let symbol = expand("<cword>")
	new
	exe "cs find d ".symbol
	if getline(1) == ""
		exe "q!"
	endif
endfunc

func! Csc()
	let symbol = expand("<cword>")
	new
	exe "cs find c ".symbol
	if getline(1) == ""
		exe "q!"
	endif
endfunc

nmap ,css :call Css()<CR>
nmap ,csg :call Csg()<CR>
nmap ,csd :call Csd()<CR>
nmap ,csc :call Csc()<CR>


" NERD Tree --------------------------------------------------------------------
let g:NERDTreeWinSize = 40


" TagList ----------------------------------------------------------------------
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 50


" Source Explorer --------------------------------------------------------------
let g:SrcExpl_winHeight = 10


" man page ---------------------------------------------------------------------
func! Man()
	let symbol = expand("<cword>")
	exe "!man -S 2:3:4:5:6:7:8:9:tcl:n:l:p:o ".symbol
endfunc

nmap ,man	:call Man()<CR><CR>
