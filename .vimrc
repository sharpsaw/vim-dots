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
  let vam_install_path = expand('$HOME') . '/.vim/vim-addons'
  call EnsureVamIsOnDisk(vam_install_path)
  exec 'set runtimepath+='.vam_install_path.'/vim-addon-manager'

  "README

  " vim-detailed - Like the default scheme, but with more expressiveness.
  "   See: http://www.vim.org/scripts/script.php?script_id=4297
  "   To enable it, you need to do something like:
  "     echo colo detailed > .vim/plugin/zzz-colorscheme.vim
  "   (Note: Only detailed for Ruby, currently)

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

  " ack provides :Ack

  " bad-whitespace highlights end-of-line whitespace
  "   :EraseBadWhitespace to kill it
  "   :HideBadWhitespace to ignore it

  " endwise closes tokens, like in Ruby "def foo<cr>" throws the "end" in
  "   Bypass with ^V{
  "   sharpsaw/perl-dots disables for Perl, because it isn't optimized there

  " gitv - Like gitk but for vim
  "   :Gitv - Lots of cool functionality.  :h gitv
  "   Plus all the fugitive stuff: :h fugitive

  " recover - Smarten up the recovery process with diff mode
  "   :FinishRecovery when done
  "   Or "a"bort to get back to the old menu

  " CtrlP.vim is an amazing plugin for fuzzyfinding. Hit ^P in normal mode.

  " vim-coffee-script doesn't really belong here, but :h :CoffeeCompile

  "end README snip

  let want = [
        \ 'github:rking/vim-detailed',
        \ 'ack',
        \ 'bad-whitespace',
        \ 'endwise',
        \ 'github:chrisbra/Recover.vim',
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
  call vam#ActivateAddons(want, {'auto_install' : 1})

  " How to find addon names?
  " - look up source from pool
  " - (<c-x><c-p> complete plugin names):
  " Also see section "2.2. names of addons and addon sources" in VAM's documentation
endfun
call SetupVAM()
