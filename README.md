# vimrc
my vimrc preferences.

## dependencies
* need ctags for tagging. for me it came with gnu/linux and macOs(12)
* fzf needs: bat, rg, and ag. 
all of those are command line utilities that won't be auto installed.

## How to install
move .vimrc to Home. (~/.vimrc)
On the first time, vim will install vim-plug. after that, may need to manually run ```:PlugInstall``` inside vim to make vim-plug install the plugins.

# settings
turned on some vim settings. you can look through the code and stuff.

## mappings

```
<c-s> saves the current edit. (normal/edit)
<c-x> saves and exits vim. (normal/edit)
<c-d> delets the current line (dd)
;; places an ; at the end of the current line
c-n toggle nerdtree and tagbar
```

### creating tags
to use tags for smart search / goto / whatever, using ctags, you can run ```:MakeTags``` inside vim. this don't have a shortcut so you won't run it by mistake.
this will create tags filr in the main directory.

### goto commands
(note that most if not all require tags)
```
gd goto tag under cursor.
gb go back in the tag tree.
```

### finding files
uses fzf (and tags, if you have those)
```
<c-f> is calling fzf (to find a file, by file name)
```

### navigation
```
move between vim buffers with ctrl + h/j/k/l
tn create a new tab
tc close the current tab
<leader>t<leader> goes to the next tag
ctrl with | or _ split according to the seperator.
```

## other plugins
* gitgutter - shows indication of diff from the file stored in git.
* airline - shows the cool status bar at the bottom.
* coc - handle autocomplete (and so much more I didn't understand yet!)
* vim-devicons - shoe icons in the nerdtree

