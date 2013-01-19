" This is how tmux defaults ^b % and ^b "

" In tmux terms, this is a 'horizontal split'. I don't know why they say it
" that way, but the visual mnemonic of the double quote is pretty clear:
map <c-w>" <c-w>v

" tmux calls this a 'vertical', and the '%' is perfectly silly, because it's
" halfway a left/right split and halfway an up/down split.
" If you can pretend that the ° is up and the o is down, then think of the /
" as a horizontal bar. Sorry, but it's the price of Acmeism with tmux
map <c-w>% <c-w>s
