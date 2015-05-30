" .vimrc used by Guy Moore.

set number              " Displays line numbers
set showmode            " Show current mode at the bottom
set visualbell          " No sounds

" Turn on syntax highlighting
syntax on

" Turn off swap files
set noswapfile
set nobackup
set nowb


"TAB THINGS
" size of a hard tab"
set tabstop=4

" combination of spaces anad tabs are used"
" to simulate tab stops at a width other"
" than the (hard)TABSTOP"
set softtabstop=0 
  
" size of an indent"
set shiftwidth=4

" make tab insert indents instead 
" beginning of a line
"set smarttab        

" (no) always uses spaces instead of tab characters
" expandtab


" Add Pathogen
execute pathogen#infect()
filetype plugin indent on


" SOLARIZED
"====================================================

" solarized color
syntax enable
set background=dark

"solarized options are optional but somtimes ruin things.
"let g:solarized_contrast = "high"
"let g:solarized_termcolors = 256
"let g:solarized_visibility = "high"
"
"Colors for vim windows inside tmux need transparency settings, but windows
"inside just iterm2 don't.
let g:solarized_termtrans = 1

"Set solarized.
colorscheme solarized



" Pathogen settings
" set laststatus=2
"set ttimeoutlen=50
