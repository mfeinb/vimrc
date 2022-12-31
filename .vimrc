" installation{{{

"dependencies:
" ctags for tagging
" bat, rg, ag for fzf
" nodejs for coc

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
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'haya14busa/incsearch.vim'

" colorthemes
Plug 'arcticicestudio/nord-vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'sainnhe/everforest'
Plug 'ghifarit53/tokyonight-vim'
Plug 'tomasiser/vim-code-dark'
call plug#end()

" }}}

" colorscheme {{{

"set background=light
"colorscheme PaperColor
set termguicolors
"colorscheme nord
let g:tokyonight_style = 'night' 
let g:tokyonight_enable_italic = 1
colorscheme tokyonight


" }}}


" general mappings {{{

inoremap jj <esc>
nnoremap <C-d> dd
noremap ;; <esc>$i;<esc>
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

" shift+arrow selection
nmap <S-Up> v<Up>
nmap <S-Down> v<Down>
nmap <S-Left> v<Left>
nmap <S-Right> v<Right>

imap <S-Up> <Up>
imap <S-Down> <Down>
imap <S-Left> <Left>
imap <S-Right> <Right>

vmap <S-Up> <Esc>v<Up>
vmap <S-Down> <Esc>v<Down>
vmap <S-Left> <Esc>v<Left>
vmap <S-Right> <Esc>v<Right>

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

" vi compatability
set nocompatible
set number
set mouse=a
set encoding=UTF-8

" to enable removing line with backspace
set backspace=indent,eol,start

" fold by syntax
" set foldmethod=syntax
set foldmethod=marker
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

filetype indent on
filetype plugin on

" ignore case when searching, unless searching with CAPS
set ignorecase
set smartcase
set hlsearch

" Set tab width to 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab


" highlight matching brackets
set showmatch

syntax on

" mark current line (can do column as well)
set cursorline

" }}}

" finding {{{

"search recursivly into subfolders
set path+=**

" activating wildmenu for finding files with wildcars (*)
set wildmenu

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>


" note : using ":b" lets you autocomplete open buffers

" }}}

" tagging {{{

" the "!" make it a shell command
command! MakeTags !ctags -R .

" jump back
nnoremap gb <c-t>


" }}}

" auto brackets {{{

inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>

inoremap <expr> <CR> search('{\%#}', 'n') ? "\<CR>\<CR>\<Up>\<C-f>" : "\<CR>"

"inoremap <expr> <CR>         --- map the <CR> key using an expression
"   search('{\%#}', 'n') ?    --- is the cursor ('\%#') between '{'and '}' ?
"   "\<CR>\<CR>\<Up>\<C-f>"   --- if so, press <CR> twice, go <Up> a line, and autoindent (<C-f>),
"   :                         --- otherwise,
"   "\<CR>"                   --- press <CR>.
"   from https://vi.stackexchange.com/questions/31702/how-to-make-vim-automatically-insert-closing-delimiters-and-new-lines-like-subli



" }}}

" navigation {{{

" navigate between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext

noremap <C-w>- :split<cr>
noremap <C-w>\| :vsplit<cr>

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


" }}}


" fzf {{{

noremap <c-g> :Files<CR>
noremap <c-f> :Rg<CR>


" }}}

" coc {{{
" all of the configurations here are copied from coc github

" make tab autocomplete (copied)
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" make CR choose selection
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)




" }}}

" NERD tree and tagbar {{{

" start tagbar and nwerdtree with vim
"autocmd vimenter * NERDTree
"autocmd vimenter * Tagbar

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" Limit the size of the Nerdtree window to 50 columns and 30 rows
let g:NERDTreeWinSize=25
let g:NERDTreeWinHigh=30

" Limit the size of the Tagbar window to 50 columns and 30 rows
let g:TagbarWinSize=35
let g:TagbarWinHigh=30


" set ignored files for nerdtree
let g:NERDTreeIgnore = ['^\.DS_Store$', '^tags$', '\.git$[[dir]]', '\.idea$[[dir]]', '\.sass-cache$']
let g:airline_filetype_overrides = {
  \ 'nerdtree': [ get(g:, 'NERDTreeStatusline', 'NRED'), '' ],
  \ 'list': [ '%y', '%l/%L'],
  \ }


" toggle nerdtree and tagbar with C-n
nnoremap <c-n> :NERDTreeToggle<CR> :TagbarToggle<CR>
inoremap <c-n> <esc> :NERDTreeToggle<CR> :TagbarToggle<CR>i

" open current file in nwerdtree
nnoremap <c-o> :NERDTreeFind<cr>
inoremap <c-o> <esc>:NERDTreeFind<CR>i

" auto exit nerdtree when exiting vim
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" make vim focus on the file instead on nerdtree when starting
autocmd VimEnter * wincmd p

" Start NERDTree and Tagbar when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'Tagbar' | execute 'cd '.argv()[0] | endif

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * silent NERDTreeMirror

" Open NERDTree in the new tabs
let g:nerdtree_tabs_open_on_new_tab=1
let g:nerdtree_tabs_meaningful_tab_names=1
let g:nerdtree_tabs_toggle=1
let g:nerdtree_tabs_autoclose=1
" Synchronize NERDTree's tabs
let g:nerdtree_tabs_synchronize_view=1



" }}}

" git gutter {{{

noremap tg :GitGutterToggle<CR>

" }}}

" airline {{{

let g:airline_powerline_fonts = 1

" }}}

" fold template {{{



" }}}
