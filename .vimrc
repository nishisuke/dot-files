" Plug begin
call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'junegunn/vim-easy-align'
Plug 'AndrewRadev/switch.vim'

Plug 'slim-template/vim-slim'
Plug 'fatih/vim-go'

Plug 'Shougo/unite.vim' " Tryal
Plug 'tpope/vim-fugitive' " Tryal
Plug 'tpope/vim-rails' " Tryal
Plug 'basyura/unite-rails'

call plug#end()

" Plug end

" mapping
" noremap never follows map
" map   noremap   unmap     ノーマル、ビジュアル、選択、オペレータ待機
" nmap  nnoremap  nunmap    ノーマル
" vmap  vnoremap  vunmap    ビジュアル、選択
" smap  snoremap  sunmap    選択
" xmap  xnoremap  xunmap    ビジュアル
" omap  onoremap  ounmap    オペレータ待機
" map!  noremap!  unmap!    挿入、コマンドライン
" imap  inoremap  iunmap    挿入
" lmap  lnoremap  lunmap    挿入、コマンドライン、Lang-Arg
" cmap  cnoremap  cunmap    コマンドライン

" ctags
nnoremap <C-]> :tab vs<CR> :exe("tjump ".expand('<cword>'))<CR>
" nnoremap <C-]> g<C-]>
set tags+=.git/tags

" fugitive
cnoremap gs Gstatus<CR><C-w>T
cnoremap ga Gwrite<CR>

" fzf
nnoremap <C-k> :Files<CR>
nnoremap <C-h> :History<CR>
nnoremap <C-b> :Buffers<CR>
nnoremap <C-g> :GFiles?<CR>

" EasyAlign
" vnoremap ga :EasyAlign

" register
vnoremap y "*y

" Indent
augroup myIndent
	autocmd!
	autocmd BufNewFile,BufRead .vimrc setlocal sw=2 sts=2 ts=2
	autocmd BufNewFile,BufRead *.py setlocal et ts=8
	autocmd BufNewFile,BufRead *.rb setlocal et sw=2 sts=2 ts=2
	autocmd BufNewFile,BufRead *.rake setlocal et sw=2 sts=2 ts=2
	autocmd BufNewFile,BufRead *.js setlocal et sw=2 sts=2 ts=2
	autocmd BufNewFile,BufRead *.jsx setlocal et sw=2 sts=2 ts=2
	autocmd BufNewFile,BufRead *.go setlocal sw=4 sts=4 ts=4
	autocmd BufNewFile,BufRead *.html setlocal et sw=2 sts=2 ts=2
	autocmd BufNewFile,BufRead *.haml setlocal et sw=2 sts=2 ts=2
	autocmd BufNewFile,BufRead *.md setlocal et sw=2 sts=2 ts=2 foldmethod=indent
	autocmd BufNewFile,BufRead ~/programming/company/candle/kaerumo/*.rb setlocal et sw=4 sts=4 ts=4
	"	autocmd BufNewFile,BufRead ~/*.c   set cindent
	" $HOME 以下のC言語ファイルに対しオプション 'cindent' をオンにする。
augroup END

" Template
augroup myTemplate
	autocmd!
	autocmd BufNewFile *.c  0r ~/.dotfiles/.vim/templates/c.c
	autocmd BufNewFile *.html  0r ~/programming/templates/html.html
	autocmd BufNewFile *.sh  0r ~/programming/languages/templates/sh.sh
augroup END


" options
" ref. http://vim-jp.org/vimdoc-ja/options.html
set noexpandtab      " tab inputs tab instead of space
set shiftwidth=2     " sift width of indent
set softtabstop=2    " number of input space when input tab
set tabstop=8        " number of space = 1 tab
set number           " show line number
set visualbell t_vb= " no beep
set hlsearch         " highlight search result
set ignorecase       " ignore large case
set smartcase        " don't ignore large case if large case is input
set incsearch        " search while inputing
set laststatus=2     " always show laststatus bar
set cursorline       " show cursor line

" Color
highlight cursorline cterm=none ctermbg=232 ctermfg=none
highlight comment cterm=none ctermfg=27
highlight search cterm=none ctermbg=19

"====================================================================
" below this I dont understand ...
"====================================================================


"set autoindent
"set cindent
set nobackup
set enc=utf-8
set fileencodings=utf-8,iso-2022-jp,sjis,euc-jp
"set fencs=iso-2022-jp,euc-jp,cp932
set ambiwidth=double

"検索関連
set wrapscan

"表示関連
set noshowmatch
let loaded_matchparen = 1
set wrap
set title
set showcmd
set cmdheight=1
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}
set wildmenu
set fileformats=unix,dos,mac

set backspace=2
set scrolloff=5
set formatoptions+=mM
let format_join_spaces = 4
let format_allow_over_tw = 1
set history=1000
set mouse=a
"set autochdir

"set migemo

set iminsert=0
set imsearch=0
set imdisable
set iminsert=1
set imsearch=1

"autocmd FileType ruby set tabstop=2 tw=0 sw=2 expandtab
"autocmd FileType eruby set tabstop=2 tw=0 sw=2 expandtab

"----------------------------------------------------
" cursor moving in insert mode 
"----------------------------------------------------
inoremap <C-a> <ESC>0i
inoremap <C-e> <ESC><S-a>
inoremap <C-d> <ESC><C-d>i
inoremap <C-u> <ESC><C-u>i
inoremap <C-w> <ESC>lwi
inoremap <C-b> <ESC>hbi

"----------------------------------------------------
" cursor moving in normal mode 
"----------------------------------------------------
" search
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" Enter always means inserting line
nnoremap <S-Enter> O<ESC>
nnoremap <Enter> o<ESC>

nnoremap <Space>.  :<C-u>edit $MYVIMRC<CR>
nnoremap <Space>,  :<C-u>source $MYVIMRC<CR>

" default key-bind of opening comamnd-line window makes typo frequently.
" " So, using qqq prefix for those.
nnoremap qqq: <Esc>q:
nnoremap qqq/ <Esc>q/
nnoremap qqq? <Esc>q?
nnoremap q: <Nop>
nnoremap q/ <Nop>
nnoremap q? <Nop>


" NERT Commenter
let NERDSpaceDelims = 1
let NERDShutUp = 1

" scheme setting
au Filetype scheme nmap <C-p> :!gosh %

" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
" filetype plugin on
"
"
" " IMPORTANT: grep will sometimes skip displaying the file name if you
" " search in a singe file. This will confuse Latex-Suite. Set your grep
" " program to always generate a file-name.
set grepprg=grep\ -nH\ $*
"
" " OPTIONAL: This enables automatic indentation as you type.
" filetype indent on
"
" " OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults
" to
" " 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" " The following changes the default filetype back to 'tex':
" let g:tex_flavor='latex'
" this is mostly a matter of taste. but LaTeX looks good with just a bit
" " of indentation.
" set sw=2
" " TIP: if you write your \label's as \label{fig:something}, then if you
" " type in \ref{fig: and press <C-n> you will automatically cycle through
" " all the figure labels. Very useful!
"set iskeyword+=:

" set grepprg=grep\ -nH\ $*
" set shellslash
" let g:Tex_CompileRule_dvi = 'platex --interaction=nonstopmode $*'
" let g:Tex_CompileRule_pdf = 'dvipdfmx $*.dvi'
" let g:Tex_FormatDependency_pdf = 'dvi,pdf'


set noerrorbells
set display=lastline
set showmatch
set matchtime=1
"
" For golang
exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
set completeopt=menu,preview
