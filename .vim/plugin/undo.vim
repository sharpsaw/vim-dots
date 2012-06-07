if exists('+undodir')
  set undodir=~/.vim/undodir
  set undofile
  set undolevels=1000 "maximum number of changes that can be undone
  set undoreload=10000 "maximum number lines to save for undo on a buffer reload
else
  " TODO:
  " if expand('$WANT_ALL_STUFF')
  "   echo "undo stuff won't work - upgrade vim"
  " end
end
