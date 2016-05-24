" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible  " Use Vim defaults instead of 100% vi compatibility
set backspace=2    " more powerful backspacing

" Fix some indent shit
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab
filetype plugin indent on " per-filetype indent options

" Highlighting on (durr)
syntax on

" Line numbers
set relativenumber number

" Pathogen
execute pathogen#infect()

" fzf
set rtp+=/usr/local/opt/fzf

" Statusline
set laststatus=2
set statusline=[%n]\ %f%(\ %r%)\%m\ %y%=%4l:%02v/%L\ %3p%%
