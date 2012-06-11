if exists('+colorcolumn')
  set colorcolumn=80
  hi ColorColumn ctermfg=black ctermbg=yellow guifg=black guibg=yellow
else
  " TODO:
  " if expand('$WANT_ALL')
  "   echo "colorcolumn won't work - upgrade vim"
  " end
end
