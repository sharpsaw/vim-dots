if exists('+colorcolumn')
  set colorcolumn=80
  " Because omnipresent red is too harsh for this gentle reminder.
  hi ColorColumn ctermfg=red ctermbg=blue guifg=black guibg=lightgrey
else
  " TODO:
  " if expand('$WANT_ALL')
  "   echo "colorcolumn won't work - upgrade vim"
  " end
end
