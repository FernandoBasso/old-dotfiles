" **** BASIC **** "
set nocompatible
filetype off


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Shougo/vimproc.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'Quramy/tsuquyomi'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
"Plugin 'vim-airline/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-rails'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'noah/vim256-color'
"Plugin 'ryanoasis/vim-devicons'

call vundle#end()

filetype plugin indent on
syntax on
set omnifunc=syntaxcomplete#Complete
set number
set ruler
set showcmd
set hidden
set scrolloff=3
set timeoutlen=350

" Indentation with SPACES
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set breakindent

set sessionoptions=blank,buffers,curdir,folds,help,options,tabpages,winsize,resize,localoptions

let g:netrw_browsex_viwer= 'xdg-open'

"let mapleader = "_"

" Indentation with HARD TABS
" set tabstop=4
" set softtabstop=4
" set shiftwidth=4
" set noexpandtab

set history=999
set undolevels=99

set encoding=utf-8
set fileencoding=utf-8

" All three settings are necessary to avoid noise... "
set noerrorbells
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

set backup
set backupdir=~/Vim_Stuff/backup
set backupext=.vimbkp
set directory=~/Vim_Stuff/tmp//


" Restore cursor position (:help restore-cursor)
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

" command line mode shortcuts "
"cnoremap <C-a> <Home>
" Go to the end of a : comand
"cnoremap <C-e> <End>
" Go one charactere to the left
"cnoremap <C-b> <Left>
" Go one charactere to the right
"cnoremap <C-f> <Right>

" ▶ is possible by typing ^k followed by PR. :help digraps.
"set listchars=tab:▶\ ,trail:-
set listchars=tab:¬\ ,trail:-
set list

" Buffers "
"nnoremap <C--> :buffers!<CR>:buffer
"inoremap <C--> :buffers!<CR>:buffer

"
" log, tmp, vendor, bin, libs and some other stuff are rails
" specific directories.
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.*(git|hg|svn|log|tmp|vendor|bin)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" CtrlP "
" change default mapping "
let g:ctrlp_map = '<c-;>'

nnoremap <Leader>f :CtrlP<CR>
inoremap <Esc><Leader>f :CtrlP<CR>

nnoremap <Leader>b :CtrlPBuffer<CR>
inoremap <Esc><Leader>b :CtrlPBuffer<CR>

nnoremap <Leader>m :CtrlPMixed<CR>
inoremap <Esc><Leader>m :CtrlPMixed<CR>

" NERDTree "
"let NERDTreeIgnore=['_site$[[dir]]']
nnoremap <F3> :NERDTreeToggle<CR>
inoremap <F3> <Esc>:NERDTreeToggle<CR>

" Open in new tabpages "
nnoremap <Leader>et :tabedit<Space><C-D>
inoremap <Leader>et <Esc>:tabedit<Space><C-D>

" Open in new normal buffers "
nnoremap <Leader>e :edit<Space><C-D>
inoremap <Leader>e <Esc>:edit<Space><C-D>

" Save the file (some terminals get locked on ctrl-s, and ctrl-q unlocks).
nnoremap <C-s> :update<CR>
inoremap <C-s> <Esc>:update<CR><Right>

inoremap <C-Space> <C-x><C-o>

" Mapping for tabpages "
map <C-N> :tabnext<Return>
map <C-P> :tabprevious<Return>

" Insert a nice formated data and time:
inoremap <F2> <C-r>=strftime('%A, %H:%M - %B %d - %Y')

" Clears the current search
nnoremap <silent> <C-l> :nohlsearch<CR><C-l>

" Change directory to the path of current file/buffer.
nnoremap cd :cd %:h<CR>:pwd<CR>


colorscheme default
highlight MatchParen ctermbg=2 ctermfg=white
highlight Visual ctermbg=233
highlight PmenuSel ctermbg=yellow ctermfg=white
highlight Comment ctermfg=4
highlight Constant ctermfg=1


if !exists("g:ycm_semantic_triggers")
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']

"
" Number sections #[Qn]# to #[Q1]#, #[Q2]#, #[Q3]#, etc.
" Also for id='Qn' and <<Qn>>.
"
function! NumberQuestions()

    "let i = 1 | g/#\[Q.\+\]#/s//\='#[Q'.i.']#'/ | let i = i + 1

    "
    " Go to the top of the file.
    "
    normal gg

    "
    " Works for id='Qn'
    "
    let i = 1 | g/id='Q.\+'/s//\="id='Q".i."'"/ | let i = i + 1

    "
    " Works for <<Qn>>
    "
    let i = 1 | g/<<Q.\+>>/s//\="<<Q".i.">>"/ | let i = i + 1

    update

endfunction



"
" UltiSnips
"
let g:UltiSnipsEditSplit="horizontal"
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"

let g:vcoolor_disable_mappings = 1
let g:vcoolor_map = '<F8>'

"
" Vim-Uploader
"
let g:VimUploaderHostsFile = '~/.vim/vupload-remotes.vim'

" Load some of my own stuff.
if hostname() != 'fernandovbsdev'
    source $HOME/.vim/mystuff/headings.vim
endif


" TagBar
nmap <F9> :TagbarToggle<CR>
let g:tagbar_left = 1

"set laststatus=2

