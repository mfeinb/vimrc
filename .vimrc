" installation{{{

" need to install ctags for tag jumping on macos
" comes with gnu/linux

" }}}


" general mappings {{{

inoremap jj <esc>
nnoremap <C-d> dd
noremap ;; <esc>i$;
nnoremap <c-z> u

" saving and quitting
noremap <c-s> <esc>:w<CR>
noremap <c-x> <esc>:wq<CR>

" folding
nnoremap z<Left> zc
nnoremap z<Right> zo
nnoremap [ zc<down>
nnoremap ] zo<down>

" }}}

" normal/insert cursor change {{{

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

set nocompatible
set number
set mouse=a
set nocompatible 

" to enable removing line with backspace
set backspace=indent,eol,start
" fold by syntax
set foldmethod=syntax

augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

filetype indent on
filetype plugin on

syntax on
set cursorline
" set cursorcolumn

" }}}

" finding files {{{

"search recursivly into subfolders
set path+=**

" activating wildmenu for finding files with wildcars (*)
set wildmenu

" note : using ":b" lets you autocomplete open buffers

" }}}

" tagging {{{

" the "!" make it a shell command
command! MakeTags !ctags -R .

" go to tag under cursor
nnoremap gd :]
" go to ambiguous tags
nnoremap gs g^]
" jump back
nnoremap gb ^t


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

" autocomplete {{{
"
" ^n - default autocomplete
" ^x^n - for just this file
" ^x^f - for filenames
" ^x^] - for tags only
"
" after that, ^n ^p go back and forth

" }}}

" fold template {{{

" stuff goes here.

" }}}



