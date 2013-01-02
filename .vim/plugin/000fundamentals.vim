set history=9999
set expandtab tabstop=8 shiftwidth=4 softtabstop=4
set hlsearch notimeout
" clipboard=
set ignorecase smartcase

set nobackup ttyfast viminfo='200,\"5000
set wildmode=list:longest,full suffixes=.bak,~,.o,.h,.info,.swp,.obj,.class
set encoding=utf-8 termencoding=utf-8
set modeline

" From :h line()
" Restores cursor position on reopen.
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

"——-—-—-—-—-—-—-—-—-—-—-—-—-—-—-—-—-—-—-—-—-—-—-—-—-—-—-—-—-—-—-—-—-—-—-—-—-—--
" sanctuary.vim - The defaults that Vim should have shipped with
" Maintainer:   Tim Pope <http://tpo.pe/>

if exists('g:loaded_sanctuary') || &compatible
  finish
endif
let g:loaded_sanctuary = 1

set autoread
set fileformats=unix,dos,mac

" An extra line at the bottom does wonders for "Press ENTER" prompts
set cmdheight=2
set laststatus=2
set ruler
set showcmd

set autoindent
set smarttab

set backspace=indent,eol,start
set showmatch

set ttimeoutlen=50

set incsearch
set smartcase

if !&list && &listchars ==# 'eol:$'
  set list listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
  if &termencoding ==# 'utf-8' || &encoding ==# 'utf-8'
    let &listchars = "tab:\u21e5 ,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u26ad"
    let &fillchars = "vert:\u259a,fold:\u00b7"
  endif
endif

set scrolloff=1
set sidescrolloff=5
set display+=lastline

set wildmenu

if &viminfo !~# '!'
  set viminfo^=!
endif

if isdirectory(expand('~/.cache/vim'))
  if &directory =~# '^\.,'
    set directory^=~/.cache/vim/swap//
  endif
  if &backupdir =~# '^\.,'
    set backupdir^=~/.cache/vim/backup//
  endif
  if exists('undodir') && &undodir =~# '^\.,'
    set undodir^=~/.cache/vim/undo//
  endif
endif
if exists('+undofile')
  set undofile
endif

" Doing this means color schemes can do bright colors without forcing bold.
" Any other terminals not really support at least 16 colors?
if $TERM !~# '^linux' && &t_Co == 8
  set t_Co=16
endif

if !exists('g:netrw_list_hide')
  let g:netrw_list_hide = '^\.,^tags$'
endif

if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

nnoremap Y y$

" Trailing period is omitted, so that you can type it as "Lidsa."
iabbrev Lidsa Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum

if !exists('g:did_load_ftplugin')
  filetype plugin on
endif
if !exists('g:did_indent_on')
  filetype indent on
endif
if !exists('g:syntax_on')
  syntax on
endif

" vim:set ft=vim et sw=2:

