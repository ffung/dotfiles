" VIM
set nocompatible

" ======= General Config =======
set number "Show linenumbers
set relativenumber "Show relative linenumbers
set guifont=Hasklig:h14
let g:airline_powerline_fonts = 1
set gcr=a:blinkon0 "Disable cursor blink
set visualbell "No sounds
set nowritebackup

" netrw
let g:netrw_altv=1
let g:netrw_winsize=25
let g:netrw_banner=0

" Automatically delete trailing whitespace
let g:DeleteTrailingWhitespace_Action = 'delete'

set dir=/var/tmp//,/tmp//,.
set undodir=/tmp/.vim/undodir
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

" Enable mouse
set mouse=a
if !has('nvim')
   set ttymouse=xterm2
endif

" Exit pastemode on insertleave
au InsertLeave * set nopaste

" Default yank and paste go to Mac's clipboard
if version >= 703 && has("macunix")
   set clipboard=unnamed
endif


" Correct syntax highlighting for Markdown
augroup markdown
  au!
  au BufRead,BufNewFile *.md set filetype=markdown
augroup END

" Correct syntax highlighting for Vagrantfile
augroup vagrant
  au!
  au BufRead,BufNewFile Vagrantfile set filetype=ruby
augroup END

filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'sjl/badwolf'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-vinegar'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'elzr/vim-json'
Plugin 'pearofducks/ansible-vim'
Plugin 'vim-scripts/ShowTrailingWhitespace'
Plugin 'vim-scripts/DeleteTrailingWhitespace'
Plugin 'hashivim/vim-hashicorp-tools'
Plugin 'fatih/vim-go'
Plugin 'leafgarland/typescript-vim'
Plugin 'ervandew/supertab'
" Haskell
Plugin 'eagletmt/ghcmod-vim'
Plugin 'eagletmt/neco-ghc'
Plugin 'Shougo/vimproc.vim'
call vundle#end()
filetype plugin indent on

set background=dark
syntax on
colorscheme badwolf

let mapleader = ","

set expandtab
set shiftwidth=4
set softtabstop=4

" Edit / source .vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <silent> <Leader>e :Explore<cr>

cnoremap w!! w !sudo tee > /dev/null %

" Haskell
map <silent> tw :GhcModTypeInsert<CR>
map <silent> ts :GhcModSplitFunCase<CR>
map <silent> tq :GhcModType<CR>
map <silent> te :GhcModTypeClear<CR>

let g:SuperTabDefaultCompletionType = '<c-x><c-o>'

if has("gui_running")
  imap <c-space> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
else " no gui
  if has("unix")
    inoremap <Nul> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
  endif
endif

let g:haskellmode_completion_ghc = 1
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
