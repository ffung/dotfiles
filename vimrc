
set nocompatible

" ======= General Config =======
set number "Show linenumbers
if exists('&guifont')
   set guifont=Hasklig:h14
endif

let g:airline_theme='one'
let g:airline_powerline_fonts = 1
set gcr=a:blinkon0 "Disable cursor blink
set visualbell "No sounds
set nowritebackup

" Disable background from ColorScheme's, use terminal's background
autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE

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

call plug#begin('~/.vim/plugged')
Plug 'bling/vim-airline'
Plug 'Chiel92/vim-autoformat'
Plug 'elzr/vim-json'
Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'rakr/vim-one'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'vim-scripts/ShowTrailingWhitespace'
Plug 'vim-scripts/DeleteTrailingWhitespace'
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'

Plug 'hashivim/vim-hashicorp-tools'

Plug 'pearofducks/ansible-vim', { 'for': 'ansible' }

Plug 'fatih/vim-go', { 'for': 'go' }

Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
Plug 'parsonsmatt/intero-neovim', { 'for': 'haskell' }
Plug 'eagletmt/ghcmod-vim', { 'for': 'haskell' }
Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }

Plug 'leafgarland/typescript-vim', {'for': 'typescript' }
call plug#end()

set background=dark
syntax on
colorscheme one

let mapleader = ","

set expandtab
set shiftwidth=4
set softtabstop=4

" FZF
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)


" Edit / source .vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <silent> <Leader>e :Explore<cr>

cnoremap w!! w !sudo tee > /dev/null %

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" Haskell
map <silent> tw :GhcModTypeInsert<CR>
map <silent> ts :GhcModSplitFunCase<CR>
map <silent> tq :GhcModType<CR>
map <silent> te :GhcModTypeClear<CR>

let g:SuperTabDefaultCompletionType = '<c-x><c-o>'
let g:haskell_tabular = 1

vmap a= :Tabularize /=<CR>
vmap a; :Tabularize /::<CR>
vmap a- :Tabularize /-><CR>

if has("gui_running")
  imap <c-space> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
else " no gui
  if has("unix")
    inoremap <Nul> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
  endif
endif

let g:necoghc_enable_detailed_browse = 1
if has("nvim")
  let g:deoplete#enable_at_startup = 1
endif
let g:python_host_prog = '/Users/fai/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/Users/fai/.pyenv/versions/neovim3/bin/python'
let g:haskellmode_completion_ghc = 0
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
call one#highlight('Pmenu', 'cccccc', '', 'none')

" Prefer ag above ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>
