"###############################################################################
"	HoYa's Vim Plugin - Source
"
"	author:		hoya128@gmail.com
"	version:	v1.0
"	note
"		2017.11.06 - First Created.
"###############################################################################
"
"	Usage
"		<F2>	NerdTree On/Off
"
"###############################################################################

" ctags -----------------------------------------------------------------------"
se		tags+=./tags
"------------------------------------------------------------------------------"

" NerdTree --------------------------------------------------------------------"
autocmd	StdinReadPre	*	let s:std_in=1
autocmd	VimEnter			*	if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd	bufenter			*	if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

map	<F2>		:NERDTreeToggle<CR>

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
	exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
	exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('md', 'blue', 'none', 'blue', '#151515')
call NERDTreeHighlightFile('sh', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('ps1', 'yellow', 'none', 'yellow', '#151515')
"------------------------------------------------------------------------------"

" Folding ---------------------------------------------------------------------"
se		fdm=marker
map		<leader>f		v]}zf
"------------------------------------------------------------------------------"
