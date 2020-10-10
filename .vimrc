"Defaults
unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim
runtime! archlinux.vim

"Compile and run code
function! CompileAndRun()
	let f_ext = fnamemodify(@%, ":e")

	if f_ext == 'c'
		:w
		:!clear && gcc % -o %:r && ./%:r
	elseif f_ext == 'py'
		:w
		:!clear && python %
	elseif f_ext == 'rs'
		:w
		:!clear && cargo run
	endif
endfunction

map <F5> :call CompileAndRun() <CR>

"Line numbers
set number "relativenumber

"Copy and paste shortcuts
map <C-c> "+y
map <C-p> "+p

"Plugins
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'morhetz/gruvbox'

call plug#end()

"Code completion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"Colorscheme
set background=dark
let g:gruvbox_contrast_dark = 'medium'
syntax enable
colorscheme gruvbox

