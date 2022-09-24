" installation{{{

function! Meaw()
	echo "meow!"
endfunction

" }}}



" general mappings {{{

inoremap jj <esc>
noremap z<Left> zc
noremap z<Right> zo
noremap <C-d> dd
noremap ;; <esc>i$;
noremap <c-s> <esc>:w<CR>
noremap <c-x> <esc>:wq<CR>

" }}}

" normal/insert  {{{

"Mode Settings

let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

"Cursor settings:

"  1 -> blinking block
"  2 -> solid block 
"  3 -> blinking underscore
"  4 -> solid underscore
"  5 -> blinking vertical bar
"  6 -> solid vertical bar

" }}}

" vim settings  {{{

set number
set mouse=a
set nocompatible 

set backspace=indent,eol,start

augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

filetype indent on
filetype on

syntax on
 set cursorline
" set cursorcolumn

" }}}

" plugins?  {{{


" }}}

" STATUS LINE {{{

" Clear status line when vimrc is reloaded.
set statusline=

" Status line left side.
set statusline+=\ %F\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side.
set statusline+=%=

" Status line right side.
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%

" Show the status on the second to last line.
set laststatus=2

" }}}


" fold template {{{

" stuff goes here.

" }}}




