
" For using with urxvt/xterm -name theme-mytheme1

" Set 'background' back to the default.  The value can't always be estimated
" and is then guessed.
hi clear Normal
set bg&

" Remove all existing highlighting and set the defaults.
hi clear

" Load the syntax highlighting defaults, if it's enabled.
if exists("syntax_on")
  syntax reset
endif

let colors_name = "mytheme1"

" vim: sw=2

highlight MatchParen ctermbg=2 ctermfg=white
highlight Visual ctermbg=233
highlight PmenuSel ctermbg=yellow ctermfg=white
highlight Comment ctermfg=4
highlight Constant ctermfg=1

" :help hl-Search. It is also used for the current, selected line in
" the quickfix window (which syntastic uses).
highlight Search ctermbg=yellow ctermfg=white

