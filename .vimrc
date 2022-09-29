" installation{{{

"dependencies:
" ctags for tagging
" bat, rg, ag for fzf

" install vim-plug in case we don't have it, copied from vim-plug github 
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" list plugins with vim-plug, install by :PlugInstall, update with :PlugUpdate
call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'preservim/tagbar'
Plug 'airblade/vim-gitgutter'

" colorthemes
Plug 'NLKNguyen/papercolor-theme'
Plug 'arcticicestudio/nord-vim'
Plug 'sainnhe/everforest'
call plug#end()

" }}}

" colorscheme {{{

"set background=light
"colorscheme PaperColor
colorscheme nord



" }}}


" general mappings {{{

inoremap jj <esc>
nnoremap <C-d> dd
noremap ;; <esc>i$;
nnoremap <c-z> u

" saving and quitting
inoremap <c-s> <esc>:w<CR>i
nnoremap <c-s> :w<CR>
inoremap <c-x> <esc>:wq<CR>
nnoremap <c-x> :wq<CR>

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

" fzf {{{

noremap <c-f> :Files<CR>


" }}}

" NERD tree and tagbar {{{

nnoremap <leader>ll :NERDTreeToggle<CR> :TagbarToggle<CR>

" }}}

" git gutter {{{

noremap <leader>gg :GitGutterToggle<CR>

" }}}

" fold template {{{



" }}}
