" Allow undo for Insert Mode ^u (thanks, osse!) - see: :help i_CTRL-G_u
inoremap <C-u> <C-g>u<C-u>

" Clear highlights on ^L
nnoremap <silent> <c-l> :nohl<CR><C-l>
