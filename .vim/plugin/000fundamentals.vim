set history=9999
set expandtab tabstop=8 shiftwidth=4 softtabstop=4
set hlsearch notimeout
set clipboard=
set ignorecase smartcase

set nobackup ttyfast viminfo='200,\"5000
set wildmode=list:longest,full suffixes=.bak,~,.o,.h,.info,.swp,.obj,.class
set encoding=utf-8 termencoding=utf-8
set modeline

" From :h line()
" Restores cursor position on reopen.
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

"  let g:netrw_list_hide = '^..?$,^tags$'
