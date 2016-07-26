set mouse=a

" No menu bar
set guioptions-=m
"set guioptions-=M
" No toolbar
set guioptions-=T

" Desabilita todos os scrollbars.
" Right-hand scrollbar when thereis a vertially split window
set guioptions-=R
" Left-Hand scrollbar
set guioptions-=L
" Left-hand scrollbar when vertically split window
set guioptions-=l
" Bottom horizontal scrollbar
set guioptions-=b
" Habilitar o icone.
set guioptions=i
" Right-hand scrollbar
set guioptions+=r
" Right scroolbar when there are splits (NERDtree, taglist).
set guioptions+=R
set guioptions+=L
set guioptions+=e

set lines=35
set columns=100

highlight Comment guifg=#aeaeae
highlight SpecialKey guifg=#cccccc

"autocmd GUIEnter * source ~/.vim/bundle/colorsel.vim/plugin/colorsel.vim

" set gvim fonts:
"set guifont=Dejavu\ Sans\ Mono\ 11
"set guifont=Mono\ 11
"set guifont=Courier\ 10\ Pitch\ 11
"set guifont=monofur\ 12
"set guifont=Monaco\ 11
"set guifont=Anonymous\ Pro\ 12
set guifont=Ubuntu\ Mono\ 12
"set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 12
"set guifont=DroidSansMonoForPowerline\ Nerd\ Font\ 12
"set guifont=Pointfree\ 11
"set guifont=Consolas\ 12
"set guifont=PT\ Mono\ 12
"set guifont=Droid\ Sans\ Mono\ 11
"set guifont=Monospace\ 10
"set guifont=Source\ Code\ Pro\ Semi-Bold\ 10
"set guifont=Source\ Code\ Pro\ Medium\ 11
"set guifont=Inconsolata\ Medium\ 12
"set guifont=Inconsolata-dz\ Medium\ 11
"set guifont=Courier\ 10\ Pitch\ 11
"set guifont=Lucida\ Console\ 10

set guicursor=n-c:hor14,i:ver14,a:blinkon0

let g:molokai_original = 1
colorscheme molokai

set showcmd
