" VIM
set nocompatible

" ======= General Config =======
set number "Show linenumbers
set relativenumber "Show relative linenumbers
set guifont=Menlo\ Regular:h20
set gcr=a:blinkon0 "Disable cursor blink
set visualbell "No sounds
set nowritebackup

set dir=/var/tmp//,/tmp//,.
set undodir=/tmp/.vim/undodir
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

filetype off 
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'sjl/badwolf'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'elzr/vim-json'
call vundle#end()  
filetype plugin indent on 

set background=dark
syntax on
colorscheme badwolf

let mapleader = ","

" Edit / source .vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

inoremap jj <esc>
inoremap <esc> <nop>
cnoremap w!! w !sudo tee > /dev/null %
