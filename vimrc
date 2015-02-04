" VIM
set nocompatible

" ======= General Config =======
set number "Show linenumbers
set guifont=Menlo\ Regular:h20
set gcr=a:blinkon0 "Disable cursor blink
set visualbell "No sounds
set nowritebackup

set dir=/var/tmp//,/tmp//,.

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
