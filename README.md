# vimrc
my vimrc preferences.

## How to install
move .vimrc to Home.
On the first time, vim will install vim-plug. after that, need to manually run :PlugUpdate to make vim-plug install the plugins.

# dependencies
* need ctags for tagging. for me it came with gnu/linux and macOs(12)
* fzf needs: bat, rg, and ag. 
all of those are command line utilities that won't be auto installed.

# settings
turned on some vim settings. you can look through the code and stuff.

# mappings
ctrl-s saves the current edit. won't change the mode (normal/edit).
ctrl-x saves and exits vim.
ctrl-d delets the current line (dd)
;; places an ; at the end of the current line.

## foldings
z-right and z-left (in normal mode) fold and unfold.
  
## fzf
use by ctrl-f
