if exists('+colorcolumn')
  if !empty($VIM_CC)
    let &colorcolumn=$VIM_CC
    hi ColorColumn ctermfg=red ctermbg=blue guifg=black guibg=lightgrey
  endif
else
  " TODO:
  " if expand('$WANT_ALL')
  "   echo "colorcolumn won't work - upgrade vim"
  " end
end
