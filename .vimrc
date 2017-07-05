" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set shell=/bin/bash
call vundle#begin()

" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Bundle 'christoomey/vim-sort-motion'

call vundle#end()
filetype plugin indent on
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

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

" Pathogen
execute pathogen#infect()

" fzf
set rtp+=/usr/local/opt/fzf

" Statusline
set laststatus=2
set statusline=[%n]\ %f%(\ %r%)\%m\ %y%=%4l:%02v/%L\ %3p%%
