"###############################################################################
"	HoYa's Vim Configuration
"
"	author:		hoya128@gmail.com
"	version:	v1.0
"	note
"		2017.10.23 - First Created.
"###############################################################################

" File Setting ----------------------------------------------------------------"
se		enc=utf-8
se		fenc=utf-8
se		fencs=ucs-bom,utf-8,korea
se		ff=unix
se	nocp
"------------------------------------------------------------------------------"

" Syntax Color ----------------------------------------------------------------"
syntax enable
se bg=dark
if has ('gui_running')
	colo HoYa
else
	colo wombat
endif
"------------------------------------------------------------------------------"

" Plugin ----------------------------------------------------------------------"
filet	off
se	rtp+=$HOME/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
call vundle#end()
filet plugin indent on
"------------------------------------------------------------------------------"

" Vim Configuration -----------------------------------------------------------"
se		ai
se		bs=indent,eol,start
se		cb=unnamed
se		cc=80
se		cin
se	noet
se		hls
se		ic
se		is
se		ls=2
se		nu
se		ru
se		scs
se		si
se		sm
se		sw=2
se		ts=2
se		tw=0
se		vb
se	nowrap
"------------------------------------------------------------------------------"
