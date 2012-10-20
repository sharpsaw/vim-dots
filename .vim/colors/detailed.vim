" So many 256-color schemes merely shift the palette around, displaying only 8
" colors total on the screen at any one time.
"
" This scheme will be more detailed than that.
"
" Companions to this file are:
" Rainbow Parens Improved:  http://www.vim.org/scripts/script.php?script_id=4176
" Indent Guides: https://github.com/nathanaelkane/vim-indent-guides
"
" TODO
"   - More languages, other than Ruby.
"   - Sync with pry-theme
"   - GUI colors
"   - Distinguish between, e.g.: class Foo < Bar, which is:
"     ['rubyBlock','rubyClassDeclaration', 'rubyConstant'] and
"     ['rubyBlock', 'rubyConstant']'
"     "osse │ rking: maybe make a new syntax rule where you fiddle with the
"       'contains' argument to :syn"
"

" Do we want this?
" hi clear

let colors_name = 'detailed'

" Prevent any screwy setting from causing errors:
let s:save_cpo = &cpo | set cpo&vim

" TODO - relocate these when things settle down:
fun! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfun
nmap <Leader>dets :call <SID>SynStack()<CR>
" (Only works if the test pane is 0)
fun! <SID>TryInTmuxPane0()
  w
  !tmux send -t0 ':colo detailed' C-m
endfun
nmap <leader>dbrb :call <SID>TryInTmuxPane0()<cr>
nmap <leader>dnew :s/hi link \v(\S*).*/call s:fg('\1', '')/<cr>

" Most colors snarfed from Term::ExtendedColor (.pm) -
" {{{
let s:c = {
  \'basic8_red': 1,
  \'basic8_green': 2,
  \'basic8_yellow': 3,
  \'basic8_blue': 4,
  \'basic8_magenta': 5,
  \'basic8_cyan': 6,
  \'rk_green1': 34,
  \'rk_purple1': 53,
  \'rk_darkred1': 88,
  \'red1': 196,
  \'red2': 160,
  \'red3': 124,
  \'red4': 088,
  \'red5': 052,
  \'green1': 156,
  \'green2': 150,
  \'green3': 120,
  \'green4': 114,
  \'green5': 084,
  \'green6': 078,
  \'green7': 155,
  \'green8': 149,
  \'green9': 119,
  \'green10': 113,
  \'green11': 083,
  \'green12': 077,
  \'green13': 047,
  \'green14': 041,
  \'green15': 118,
  \'green16': 112,
  \'green17': 082,
  \'green18': 076,
  \'green19': 046,
  \'green20': 040,
  \'green21': 034,
  \'green22': 028,
  \'green23': 022,
  \'green24': 107,
  \'green25': 071,
  \'green26': 070,
  \'green27': 064,
  \'green28': 065,
  \'blue1': 075,
  \'blue2': 074,
  \'blue3': 073,
  \'blue4': 039,
  \'blue5': 038,
  \'blue6': 037,
  \'blue7': 033,
  \'blue8': 032,
  \'blue9': 031,
  \'blue10': 027,
  \'blue11': 026,
  \'blue12': 025,
  \'blue13': 021,
  \'blue14': 020,
  \'blue15': 019,
  \'blue16': 018,
  \'blue17': 017,
  \'yellow1': 228,
  \'yellow2': 222,
  \'yellow3': 192,
  \'yellow4': 186,
  \'yellow5': 227,
  \'yellow6': 221,
  \'yellow7': 191,
  \'yellow8': 185,
  \'yellow9': 226,
  \'yellow10': 220,
  \'yellow11': 190,
  \'yellow12': 184,
  \'yellow13': 214,
  \'yellow14': 178,
  \'yellow15': 208,
  \'yellow16': 172,
  \'yellow17': 202,
  \'yellow18': 166,
  \'magenta1': 219,
  \'magenta2': 183,
  \'magenta3': 218,
  \'magenta4': 182,
  \'magenta5': 217,
  \'magenta6': 181,
  \'magenta7': 213,
  \'magenta8': 177,
  \'magenta9': 212,
  \'magenta10': 176,
  \'magenta11': 211,
  \'magenta12': 175,
  \'magenta13': 207,
  \'magenta14': 171,
  \'magenta15': 205,
  \'magenta16': 169,
  \'magenta17': 201,
  \'magenta18': 165,
  \'magenta19': 200,
  \'magenta20': 164,
  \'magenta21': 199,
  \'magenta22': 163,
  \'magenta23': 198,
  \'magenta24': 162,
  \'magenta25': 197,
  \'magenta26': 161,
  \'gray1': 255,
  \'gray2': 254,
  \'gray3': 253,
  \'gray4': 252,
  \'gray5': 251,
  \'gray6': 250,
  \'gray7': 249,
  \'gray8': 248,
  \'gray9': 247,
  \'gray10': 246,
  \'gray11': 245,
  \'gray12': 244,
  \'gray13': 243,
  \'gray14': 242,
  \'gray15': 241,
  \'gray16': 240,
  \'gray17': 239,
  \'gray18': 238,
  \'gray19': 237,
  \'gray20': 236,
  \'gray21': 235,
  \'gray22': 234,
  \'gray23': 233,
  \'gray24': 232,
  \'purple1': 147,
  \'purple2': 146,
  \'purple3': 145,
  \'purple4': 141,
  \'purple5': 140,
  \'purple6': 139,
  \'purple7': 135,
  \'purple8': 134,
  \'purple9': 133,
  \'purple10': 129,
  \'purple11': 128,
  \'purple12': 127,
  \'purple13': 126,
  \'purple14': 125,
  \'purple15': 111,
  \'purple16': 110,
  \'purple17': 109,
  \'purple18': 105,
  \'purple19': 104,
  \'purple20': 103,
  \'purple21': 099,
  \'purple22': 098,
  \'purple23': 097,
  \'purple24': 096,
  \'purple25': 093,
  \'purple26': 092,
  \'purple27': 091,
  \'purple28': 090,
  \'purple29': 055,
  \'purple30': 054,
  \'cyan1': 159,
  \'cyan2': 158,
  \'cyan3': 157,
  \'cyan4': 153,
  \'cyan5': 152,
  \'cyan6': 151,
  \'cyan7': 123,
  \'cyan8': 122,
  \'cyan9': 121,
  \'cyan10': 117,
  \'cyan11': 116,
  \'cyan12': 115,
  \'cyan13': 087,
  \'cyan14': 086,
  \'cyan15': 085,
  \'cyan16': 081,
  \'cyan17': 080,
  \'cyan18': 079,
  \'cyan19': 051,
  \'cyan20': 050,
  \'cyan21': 049,
  \'cyan22': 045,
  \'cyan23': 044,
  \'cyan24': 043,
  \'orange1': 208,
  \'orange2': 172,
  \'orange3': 202,
  \'orange4': 166,
  \'orange5': 130,
  \'aquamarine1': 086,
  \'aquamarine3': 079,
  \'blueviolet': 057,
  \'cadetblue1': 072,
  \'cadetblue2': 073,
  \'chartreuse1': 118,
  \'chartreuse2': 082,
  \'chartreuse3': 070,
  \'chartreuse4': 064,
  \'cornflowerblue': 069,
  \'cornsilk1': 230,
  \'darkblue': 018,
  \'darkcyan': 036,
  \'darkgoldenrod': 136,
  \'darkgreen': 022,
  \'darkkhaki': 143,
  \'darkmagenta1': 090,
  \'darkmagenta2': 091,
  \'darkolivegreen1': 191,
  \'darkolivegreen2': 155,
  \'darkolivegreen3': 107,
  \'darkolivegreen4': 113,
  \'darkolivegreen5': 149,
  \'darkorange3': 130,
  \'darkorange4': 166,
  \'darkorange1': 208,
  \'darkred1': 052,
  \'darkred2': 088,
  \'darkseagreen1': 158,
  \'darkseagreen2': 157,
  \'darkseagreen3': 150,
  \'darkseagreen4': 071,
  \'darkslategray1': 123,
  \'darkslategray2': 087,
  \'darkslategray3': 116,
  \'darkturquoise': 044,
  \'darkviolet': 128,
  \'deeppink1': 198,
  \'deeppink2': 197,
  \'deeppink3': 162,
  \'deeppink4': 125,
  \'deepskyblue1': 039,
  \'deepskyblue2': 038,
  \'deepskyblue3': 031,
  \'deepskyblue4': 023,
  \'dodgerblue1': 033,
  \'dodgerblue2': 027,
  \'dodgerblue3': 026,
  \'gold1': 220,
  \'gold3': 142,
  \'greenyellow': 154,
  \'grey0': 016,
  \'grey3': 232,
  \'grey7': 233,
  \'grey11': 234,
  \'grey15': 235,
  \'grey19': 236,
  \'grey23': 237,
  \'grey27': 238,
  \'grey30': 239,
  \'grey35': 240,
  \'grey37': 059,
  \'grey39': 241,
  \'grey42': 242,
  \'grey46': 243,
  \'grey50': 244,
  \'grey53': 102,
  \'grey54': 245,
  \'grey58': 246,
  \'grey62': 247,
  \'grey63': 139,
  \'grey66': 248,
  \'grey69': 145,
  \'grey70': 249,
  \'grey74': 250,
  \'grey78': 251,
  \'grey82': 252,
  \'grey84': 188,
  \'grey85': 253,
  \'grey89': 254,
  \'grey93': 255,
  \'grey100': 231,
  \'honeydew2': 194,
  \'hotpink2': 169,
  \'hotpink3': 132,
  \'hotpink': 205,
  \'indianred1': 203,
  \'indianred': 167,
  \'khaki1': 228,
  \'khaki3': 185,
  \'lightcoral': 210,
  \'lightcyan1': 195,
  \'lightcyan3': 152,
  \'lightgoldenrod1': 227,
  \'lightgoldenrod2': 186,
  \'lightgoldenrod3': 179,
  \'lightgreen': 119,
  \'lightpink1': 217,
  \'lightpink3': 174,
  \'lightpink4': 095,
  \'lightsalmon1': 216,
  \'lightsalmon2': 137,
  \'lightsalmon3': 173,
  \'lightseagreen': 037,
  \'lightskyblue1': 153,
  \'lightskyblue2': 109,
  \'lightskyblue3': 110,
  \'lightslateblue': 105,
  \'lightslategrey': 103,
  \'lightsteelblue1': 189,
  \'lightsteelblue3': 146,
  \'lightsteelblue': 147,
  \'lightyellow3': 187,
  \'mediumorchid1': 171,
  \'mediumorchid3': 133,
  \'mediumorchid': 134,
  \'mediumpurple1': 141,
  \'mediumpurple2': 135,
  \'mediumpurple3': 097,
  \'mediumpurple4': 060,
  \'mediumpurple': 104,
  \'mediumspringgreen': 049,
  \'mediumturquoise': 080,
  \'mediumvioletred': 126,
  \'mistyrose1': 224,
  \'mistyrose3': 181,
  \'navajowhite1': 223,
  \'navajowhite3': 144,
  \'navyblue': 017,
  \'orangered1': 202,
  \'orchid1': 213,
  \'orchid2': 212,
  \'orchid': 170,
  \'palegreen1': 121,
  \'palegreen3': 077,
  \'paleturquoise1': 159,
  \'paleturquoise4': 066,
  \'palevioletred1': 211,
  \'pink1': 218,
  \'pink3': 175,
  \'plum1': 219,
  \'plum2': 183,
  \'plum3': 176,
  \'plum4': 096,
  \'purple': 129,
  \'rosybrown': 138,
  \'royalblue1': 063,
  \'salmon1': 209,
  \'sandybrown': 215,
  \'seagreen1': 084,
  \'seagreen2': 083,
  \'seagreen3': 078,
  \'skyblue1': 117,
  \'skyblue2': 111,
  \'skyblue3': 074,
  \'slateblue1': 099,
  \'slateblue3': 061,
  \'springgreen1': 048,
  \'springgreen2': 042,
  \'springgreen3': 035,
  \'springgreen4': 029,
  \'steelblue1': 075,
  \'steelblue3': 068,
  \'steelblue': 067,
  \'tan': 180,
  \'thistle1': 225,
  \'thistle3': 182,
  \'turquoise2': 045,
  \'turquoise4': 030,
  \'violet': 177,
  \'wheat1': 229,
  \'wheat4': 101,
  \}
" }}}

fun! s:fg(group, color_name, ...)
  let cmd = 'hi '.a:group
  if 1 == a:0
    let cmd .= ' cterm='.a:1
    " term=bold cterm=bold ctermfg=135 guifg=Cyan"
  endif
  let cmd .= ' ctermfg='.s:c[a:color_name]
  exe cmd
endfun

hi SpecialKey     term=bold ctermfg=81 guifg=Cyan
hi NonText        term=bold ctermfg=12 gui=bold guifg=Blue
hi Directory      term=bold ctermfg=159 guifg=Cyan
hi ErrorMsg       term=standout ctermfg=15 ctermbg=1 guifg=White guibg=Red
hi IncSearch      term=reverse cterm=reverse gui=reverse
hi Search         term=reverse ctermfg=0 ctermbg=11 guifg=Black guibg=Yellow
hi MoreMsg        term=bold ctermfg=121 gui=bold guifg=SeaGreen
hi ModeMsg        term=bold cterm=bold gui=bold
hi LineNr         term=underline ctermfg=11 guifg=Yellow
hi CursorLineNr   term=bold ctermfg=11 gui=bold guifg=Yellow
hi Question       term=standout ctermfg=121 gui=bold guifg=Green
hi StatusLine     term=bold,reverse cterm=bold,reverse gui=bold,reverse
hi StatusLineNC   term=reverse cterm=reverse gui=reverse
hi VertSplit      term=reverse cterm=reverse gui=reverse
hi Title          term=bold ctermfg=225 gui=bold guifg=Magenta
hi Visual         term=reverse ctermbg=242 guibg=DarkGrey
hi VisualNOS      term=bold,underline cterm=bold,underline gui=bold,underline
hi WarningMsg     term=standout ctermfg=224 guifg=Red
hi WildMenu       term=standout ctermfg=0 ctermbg=11 guifg=Black guibg=Yellow
hi Folded         term=standout ctermfg=14 ctermbg=242 guifg=Cyan guibg=DarkGrey
hi FoldColumn     term=standout ctermfg=14 ctermbg=242 guifg=Cyan guibg=Grey
hi DiffAdd        term=bold ctermbg=4 guibg=DarkBlue
hi DiffChange     term=bold ctermbg=5 guibg=DarkMagenta
hi DiffDelete     term=bold ctermfg=12 ctermbg=6 gui=bold guifg=Blue guibg=DarkCyan
hi DiffText       term=reverse cterm=bold ctermbg=9 gui=bold guibg=Red
hi SignColumn     term=standout ctermfg=14 ctermbg=242 guifg=Cyan guibg=Grey
hi Conceal        ctermfg=7 ctermbg=242 guifg=LightGrey guibg=DarkGrey
hi SpellBad       term=reverse ctermbg=9 gui=undercurl guisp=Red
hi SpellCap       term=reverse ctermbg=12 gui=undercurl guisp=Blue
hi SpellRare      term=reverse ctermbg=13 gui=undercurl guisp=Magenta
hi SpellLocal     term=underline ctermbg=14 gui=undercurl guisp=Cyan
hi Pmenu          ctermfg=0 ctermbg=13 guibg=Magenta
hi PmenuSel       ctermfg=0 ctermbg=242 guibg=DarkGrey
hi PmenuSbar      ctermbg=248 guibg=Grey
hi PmenuThumb     ctermbg=15 guibg=White
hi TabLine        term=underline cterm=underline ctermfg=15 ctermbg=242 gui=underline guibg=DarkGrey
hi TabLineSel     term=bold cterm=bold gui=bold
hi TabLineFill    term=reverse cterm=reverse gui=reverse
hi CursorColumn   term=reverse ctermbg=242 guibg=Grey40
hi CursorLine     term=underline cterm=underline guibg=Grey40
hi ColorColumn    term=reverse ctermfg=9 ctermbg=12 guifg=black guibg=lightgrey
hi MatchParen     term=reverse ctermbg=6 guibg=DarkCyan
hi Comment        term=bold ctermfg=14 guifg=#80a0ff
hi Constant       term=underline ctermfg=13 guifg=#ffa0a0
hi Special        term=bold ctermfg=224 guifg=Orange
hi Identifier     term=underline cterm=bold ctermfg=14 guifg=#40ffff
hi Statement      term=bold ctermfg=11 gui=bold guifg=#ffff60
hi PreProc        term=underline ctermfg=81 guifg=#ff80ff
hi Type           term=underline ctermfg=121 gui=bold guifg=#60ff60
hi Underlined     term=underline cterm=underline ctermfg=81 gui=underline guifg=#80a0ff
hi Ignore         ctermfg=0 guifg=bg
hi Error          term=reverse ctermfg=15 ctermbg=9 guifg=White guibg=Red
hi Todo           term=standout ctermfg=0 ctermbg=11 guifg=Blue guibg=Yellow

" These are the ones I'm trying to specialize instead of "link"
hi link String          Constant
hi link Character       Constant
hi link Number          Constant
hi link Boolean         Constant
hi link Float           Number
hi link Function        Identifier
hi link Conditional     Statement
hi link Repeat          Statement
hi link Label           Statement
hi link Operator        Statement
hi link Keyword         Statement
call s:fg('Exception', 'orange1') " Like default yellow but more warny.
hi link Include         PreProc
hi link Define          PreProc
hi link Macro           PreProc
hi link PreCondit       PreProc
hi link StorageClass    Type
hi link Structure       Type
hi link Typedef         Type
hi link Tag             Special
hi link SpecialChar     Special
hi link Delimiter       Special
hi link SpecialComment  Special
hi link Debug           Special
hi link mailQuoted1     Type
hi link GPGWarning      WarningMsg
hi link GPGError        ErrorMsg
hi link GPGHighlightUnknownRecipient  ErrorMsg
hi link rubyConditional  Conditional
hi link rubyExceptional  rubyConditional
hi link rubyMethodExceptional  rubyDefine
hi link rubyTodo        Todo
hi link rubyStringEscape  Special
hi link rubyQuoteEscape  rubyStringEscape
hi link rubyInterpolationDelimiter  Delimiter
" hi rubyInterpolation cleared
hi link rubyInstanceVariable  rubyIdentifier
hi link rubyClassVariable  rubyIdentifier
hi link rubyGlobalVariable  rubyIdentifier
hi link rubyPredefinedVariable  rubyPredefinedIdentifier
hi link rubyInvalidVariable  Error
hi link rubyNoInterpolation  rubyString
" hi NONE           cleared
" hi rubyDelimEscape cleared
call s:fg('rubyString', 'rk_darkred1')
" hi rubyNestedParentheses cleared
" hi rubyNestedCurlyBraces cleared
" hi rubyNestedAngleBrackets cleared
" hi rubyNestedSquareBrackets cleared
hi link rubyRegexpSpecial  Special
hi link rubyRegexpComment  Comment
" hi rubyRegexpParens cleared
hi link rubyRegexpCharClass  rubyRegexpSpecial
hi link rubyRegexpEscape  rubyRegexpSpecial
" hi rubyRegexpBrackets cleared
hi link rubyRegexpQuantifier  rubyRegexpSpecial
hi link rubyRegexpAnchor  rubyRegexpSpecial
hi link rubyRegexpDot   rubyRegexpCharClass
hi link rubyASCIICode   Character
hi link rubyInteger     Number
hi link rubyFloat       Float
" hi rubyLocalVariableOrMethod cleared
" hi rubyBlockArgument cleared
call s:fg('rubyConstant', 'rk_green1')
hi link rubySymbol      Constant
hi link rubyBlockParameter  rubyIdentifier
" hi rubyBlockParameterList cleared
hi link rubyPredefinedConstant  rubyPredefinedIdentifier
hi link rubyRegexpDelimiter  rubyStringDelimiter
hi link rubyRegexp      rubyString
hi link rubyStringDelimiter  Delimiter
hi link rubySymbolDelimiter  rubyStringDelimiter
" hi rubyHeredocStart cleared
" hi rubyAliasDeclaration2 cleared
" hi rubyAliasDeclaration cleared
hi link rubyBoolean     Boolean
hi link rubyPseudoVariable  Constant
" hi rubyMethodDeclaration cleared
hi link rubyOperator    Operator
" hi rubyClassDeclaration cleared
" hi rubyModuleDeclaration cleared
hi link rubyFunction    Function
hi link rubyControl     Statement
hi link rubyKeyword     Keyword
hi link rubyBeginEnd    Statement
call s:fg('rubyDefine', 'purple9')
call s:fg('rubyClass', 'purple13', 'bold')
call s:fg('rubyModule', 'purple13')
" hi rubyMethodBlock cleared
" hi rubyBlock      cleared
hi link rubyConditionalModifier  rubyConditional
hi link rubyRepeatModifier  rubyRepeat
" hi rubyDoBlock    cleared
" hi rubyCurlyBlock cleared
" hi rubyArrayDelimiter cleared
" hi rubyArrayLiteral cleared
" hi rubyBlockExpression cleared
" hi rubyCaseExpression cleared
" hi rubyConditionalExpression cleared
call s:fg('rubyRepeat', 'yellow14')
hi link rubyOptionalDo  rubyRepeat
" hi rubyOptionalDoLine cleared
" hi rubyRepeatExpression cleared
hi link rubyAccess      Statement
hi link rubyAttribute   Statement
hi link rubyEval        Statement
hi link rubyException   Exception
call s:fg('rubyInclude', 'rk_purple1')
call s:fg('rubySharpBang', 'grey27')
hi link rubySpaceError  rubyError
call s:fg('rubyComment', 'grey39')
" hi rubyMultilineComment cleared
hi link rubyDocumentation  Comment
" hi rubyKeywordAsMethod cleared
hi link rubyDataDirective  Delimiter
hi link rubyData        Comment
hi link rubyIdentifier  Identifier
hi link rubyPredefinedIdentifier  rubyIdentifier
hi link rubyPseudoOperator  rubyOperator
hi link rubyError       Error
hi BadWhitespace  ctermbg=9 guibg=red

let &cpo = s:save_cpo

" vim:foldmethod=marker
