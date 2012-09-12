" https://github.com/tpope/vim-pathogen
call pathogen#infect() 

fun! EnsureVamIsOnDisk(vam_install_path)
  if !filereadable(a:vam_install_path.'/vim-addon-manager/.git/config')
     \&& 1 == confirm("Clone VAM into ".a:vam_install_path."?","&Y\n&N")
    call mkdir(a:vam_install_path, 'p')
    execute '!git clone --depth=1 git://github.com/MarcWeber/vim-addon-manager '.shellescape(a:vam_install_path, 1).'/vim-addon-manager'
    exec 'helptags '.fnameescape(a:vam_install_path.'/vim-addon-manager/doc')
  endif
endf

fun! SetupVAM()
  " Set advanced options like this:
  " let g:vim_addon_manager = {}
  " let g:vim_addon_manager['key'] = value
  " Hrm: ^ what is available?

  let vam_install_path = expand('$HOME') . '/.vim/vim-addons'
  call EnsureVamIsOnDisk(vam_install_path)
  exec 'set runtimepath+='.vam_install_path.'/vim-addon-manager'

  " The textobjs here provide extra motions/nouns, e.g. vae selects the entire
  " buffer, da/ deletes to the last pattern, etc. If you play with it as "v__"
  " you'll see what each does, or else :h textobj<tab>
  " textobj-indent - ai ii aI iI
  " textobj-lastpat - a/ a? …
  " textobj-diff - adh adf …
  " textobj-entire - ae …
  " kana/vim-textobj-underscore - i_ a_
  " TODO: http://webtech-walker.com/archive/2009/11/05223206.html
  " …plus more in the various foo-dots
  let want = [
        \ 'ack',
        \ 'bad-whitespace',
        \ 'endwise',
        \ 'gitv',
        \ 'textobj-user',
        \ 'textobj-indent',
        \ 'textobj-lastpat',
        \ 'textobj-diff',
        \ 'textobj-entire',
        \ 'github:kana/vim-textobj-underscore',
        \ 'github:Raimondi/vim-transpose-words',
        \ 'github:kien/ctrlp.vim',
        \ 'github:kchmck/vim-coffee-script',
        \ ]
  " TODO:
  " let want += [ 'vim-addon-rdebug' ]
  " let want += [ 'vim-ruby-debugger' ]
  " let want += [ 'github:MarcWeber/vim-addon-ruby-debug-ide' ]
  call vam#ActivateAddons(want, {'auto_install' : 1})

  " How to find addon names?
  " - look up source from pool
  " - (<c-x><c-p> complete plugin names):
  " Also see section "2.2. names of addons and addon sources" in VAM's documentation
endfun
call SetupVAM()
