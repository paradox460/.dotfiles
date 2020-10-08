if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
Plug 'godlygeek/tabular'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'kana/vim-textobj-user'
Plug 'christoomey/vim-sort-motion' "Sort Motions
Plug 'haya14busa/vim-asterisk' " Better * search
Plug 'haya14busa/is.vim' " Incremental Switch enhancements
Plug 'google/vim-searchindex' " Show [1/3] for search
Plug 'vim-pandoc/vim-pandoc' " Pandoc for great justice. Also better markdown than anything else
Plug 'vim-pandoc/vim-pandoc-syntax' " Syntax Plug for pandoc styles
Plug 'dhruvasagar/vim-table-mode' " Markdown tables, made easier
Plug 'scrooloose/nerdcommenter' " Easier commenting
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Code Completion

call plug#end()
