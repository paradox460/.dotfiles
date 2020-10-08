set nocompatible              " be iMproved, required

" set shell=bash " Lots of plugins choke on fish shell
try
  source ~/.vim/config/plugins.vim
  source ~/.vim/config/coc-vim-configs.vim
catch
endtry

set backspace=2    " more powerful backspacing

" Fix some indent shit
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab
filetype plugin indent on " per-filetype indent options

" Highlighting on (durr)
syntax on

" Line numbers
set relativenumber number

" Show command
set showcmd

" Search enhancements
set hlsearch " enable highlight search queries
set incsearch " highlight search as you type

" Hidden buffer support
set hidden

" fzf
set rtp+=/usr/local/opt/fzf

" Statusline
set laststatus=2
set statusline=[%n]\ %f%(\ %r%)\%m\ %y%=%4l:%02v/%L\ %3p%%

" EasyMotion
let g:EasyMotion_smartcase = 1
let g:EasyMotion_keys='qwertzxcvbgasdf'

" Asterisk
let g:asterisk#keeppos = 1

" Tables
let g:table_mode_corner='|'

" NERDCommenter
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1

" Load custom keybinds
try
  source ~/.vim/config/keybinds.vim
catch
endtry
