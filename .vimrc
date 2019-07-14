autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8
\ formatoptions+=croq softtabstop=4 smartindent
\ cinwords=if,elif,else,for,while,try,except,finally,def,class,with

set nu

set nocompatible              " be iMproved, required
filetype off                  " required
set enc=utf-8	     " utf-8

"=====================================================
" Vundle settings
"=====================================================
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'        " let Vundle manage Vundle, required

"---------=== Code/project navigation ===-------------
Plugin 'scrooloose/nerdtree'             " Project and file navigation
"Plugin 'majutsushi/tagbar'              " Class/module browser

"------------------=== Other ===----------------------
Plugin 'bling/vim-airline'               " Lean & mean status/tabline for vim
Plugin 'fisadev/FixedTaskList.vim'      " Pending tasks list
"Plugin 'rosenfeld/conque-term'          " Consoles as buffers
Plugin 'tpope/vim-surround'           " Parentheses, brackets, quotes, XML tags, and more
Plugin 'Valloric/YouCompleteMe' " New completion module
Plugin 'jiangmiao/auto-pairs'    " Auto brackets close

"--------------=== Snippets support ===---------------
"Plugin 'garbas/vim-snipmate'        " Snippets manager
"Plugin 'MarcWeber/vim-addon-mw-utils'    " dependencies #1
"Plugin 'tomtom/tlib_vim'        " dependencies #2
"Plugin 'honza/vim-snippets'        " snippets repo

"---------------=== Languages support ===-------------
" --- Python ---
Plugin 'klen/python-mode'            " Python mode (docs, refactor, lints, highlighting, run and ipdb and more)
Plugin 'davidhalter/jedi-vim'         " Jedi-vim autocomplete plugin
"Plugin 'mitsuhiko/vim-jinja'        " Jinja support for vim
"Plugin 'mitsuhiko/vim-python-combined'  " Combined Python 2/3 for Vim

call vundle#end()                    " required
filetype on
filetype plugin on
filetype plugin indent on

"----------------- JEDI config-------------------

let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0

"-----------------PyMode config
let g:pymode_rope_complete_on_dot = 1
let g:pymode_doc = 0
let g:pymode_rope = 1

set completeopt=menu "show completion menu without popup

:let mapleader=" "
"autocmd vimenter * NERDTree
"open Nerdtree by <l>f
nnoremap <Leader>f :NERDTreeToggle<Enter> 
"close Nerdtree if it's last tab
"autocmd bufenter * if (winnr(“$”) == 1 && exists(“b:NERDTreeType”) && b:NERDTreeType == “primary”) | q | endif

set pastetoggle=<F3>

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

set hlsearch
set fdm=indent
let g:pymode_folding = 0
let g:pymode_options_colorcolumn = 0
let g:loaded_youcompleteme = 1
vnoremap <silent> # :s/^/#/<cr>:noh<cr>
vnoremap <silent> -# :s/^#//<cr>:noh<cr>
:command CurDiff w !diff % -
set backspace=indent,eol,start
syntax on
let g:pymode_lint = 0

function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()
nnoremap <F4> :DiffSaved<Enter>
