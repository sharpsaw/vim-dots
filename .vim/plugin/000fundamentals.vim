syntax on
filetype plugin indent on

set incsearch ignorecase smartcase
set history=9999 ruler
set autoindent expandtab tabstop=8 shiftwidth=4 softtabstop=4
set backspace=indent,eol,start hlsearch notimeout clipboard=
set autoread nobackup ttyfast viminfo='200,\"5000
set wildmode=list:longest,full suffixes=.bak,~,.o,.h,.info,.swp,.obj,.class
set encoding=utf-8 termencoding=utf-8
set modeline
set hidden " Popular on #vim, but takes some getting used to.

" From :h line()
" Restores cursor position on reopen.
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
