" From :h DiffOrig
" Run :DiffOrig to see how a file has changed since last write.
command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_
    \ | diffthis | wincmd p | diffthis
