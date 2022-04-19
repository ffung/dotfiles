scriptencoding utf-8
set encoding=utf-8
set nocompatible

" ======= General Config =======
syntax on                  " Enable syntax highlighting

set autoread               " Reload changed files that have not been modified
set autowrite              " Write automatically when buffer has been modified
set clipboard+=unnamedplus " Use system clipboard
set hidden                 " Hide unwritten buffers, instead of trying to close the buffer
set matchtime=2            " Show matching bracket 0.2 second
set mouse=a                " Enable mouse support for (almost) all modes
set number                 " Show linenumbers
set showmatch              " Show matching bracket
set visualbell             " Use a visual bell instead of beeping
set termguicolors          " Enable 24-bit RGB color
set title                  " Set the title of the window

if has("gui_running")
   set guicursor=a:blinkon0 "Disable cursor blink
endif

" Search settings
set hlsearch   " Highlight results
set ignorecase " Ignore casing of searches
set incsearch  " Start showing results as you type
set smartcase  " Be smart about case sensitivity when searching

" Backup settings
set backup                        " Make a backup before overwriting a file
set undofile                      " Save undo history to an undo file
set dir=/var/tmp//,/tmp//,.       " Appropriate Swap file directories
set backupdir=/var/tmp//,/tmp//,. " Appropriate Backup file directories
set undodir=/var/tmp//,/tmp//,.   " Appropriate Undo file directories

" Tab settings
set expandtab      " Expand tabs to spaces
set shiftwidth=4   " Number of spaces to use for each step of (auto)indent
set softtabstop=4  " Number of spaces a Tab counts for while editing
set tabstop=4      " Number of spaces a Tab counts for in a file
set smartindent    " Do smart indenting when starting a new line

let mapleader = ","

" ======= Autocommands =======
autocmd InsertLeave * set nopaste " Exit pastemode on insertleave
autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE " Disable background from ColorScheme's, use terminal's background

" ======= Key Mappings =======
"
" Edit / source .vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Open side explorer
nnoremap <silent> <Leader>e :Lexplore<cr>
" Write current buffer using sudo
cnoremap w!! w !sudo tee > /dev/null %

" Centered next/previous match (unfold)
nnoremap n nzzzv
nnoremap N Nzzzv

" Join lines, keep cursor position
nnoremap J mzJ`z

" Add extra undo breakpoints
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
inoremap , ,<c-g>u

if !has('nvim')
    call plug#begin('~/.vim/plugged')
else
    call plug#begin(stdpath('data') . '/plugged')
    Plug 'neovim/nvim-lspconfig'                                 " A collection of common configurations for Neovim's built-in lsp-client
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " Treesitter based highlighting
    Plug 'nvim-treesitter/playground'                            " Treesitter playground to understand what Treesitter does
    Plug 'neovim/nvim-lspconfig'                                 " Automatically launching and initializing of installed language servers
    Plug 'nvim-lua/popup.nvim'                                   " Telescope dependency
    Plug 'nvim-lua/plenary.nvim'                                 " Telescope dependency
    Plug 'nvim-telescope/telescope.nvim'                         " Highly extendable fuzzy finder over lists
    Plug 'nvim-telescope/telescope.nvim'                         " Highly extendable fuzzy finder over lists
    Plug 'hrsh7th/nvim-cmp'                                      " Auto completion
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/cmp-vsnip'                                     " Auto completion
    Plug 'hrsh7th/vim-vsnip'                                     " Auto completion
    Plug 'rafamadriz/friendly-snippets'                          " Collection of snippets
endif
    Plug 'rakr/vim-one'         " theme
    Plug 'bling/vim-airline'    " status line
    Plug 'tpope/vim-sensible'   " sensible defaults
    Plug 'tpope/vim-commentary' " easy commenting
    Plug 'tpope/vim-fugitive'   " git
    Plug 'tpope/vim-repeat'     " repeat plugin maps using ..
    Plug 'tpope/vim-surround'   " easy surrounding
    Plug 'tpope/vim-unimpaired' " pair of mappings to go back/forward, toggle on/of on different objects
    Plug 'tpope/vim-vinegar'    " netrw enhancementsp
    Plug 'ervandew/supertab'    " insert completion using <Tab>
    Plug 'godlygeek/tabular'    " aligning text

    Plug 'ntpeters/vim-better-whitespace' " Remove trailing whitespace
call plug#end()

" theme one settings
colorscheme one
let g:one_allow_italics = 1
highlight Comment cterm=italic
call one#highlight('Pmenu', 'cccccc', '', 'none')

" vim-airline settings
let g:airline_theme='one' "vim-one theme
let g:airline_powerline_fonts = 1

" vim-better-whitespace settings
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0
let g:show_spaces_that_precede_tabs=1

" supertab
let g:SuperTabDefaultCompletionType = "<c-n>" " Scroll down the list by default

if has('nvim')
  tnoremap <Esc> <C-\><C-n> " Map escape to exit terminal mode
  tnoremap <M-[> <Esc>      " Send literal <esc>
  tnoremap <C-v><Esc> <Esc> " Send literal <esc> alternative mapping, mnemonic *V*erbatim <esc>

  " Terminal mode:
  tnoremap <M-h> <c-\><c-n><c-w>h
  tnoremap <M-j> <c-\><c-n><c-w>j
  tnoremap <M-k> <c-\><c-n><c-w>k
  tnoremap <M-l> <c-\><c-n><c-w>l
  " Insert mode:
  inoremap <M-h> <Esc><c-w>h
  inoremap <M-j> <Esc><c-w>j
  inoremap <M-k> <Esc><c-w>k
  inoremap <M-l> <Esc><c-w>l
  " Visual mode:
  vnoremap <M-h> <Esc><c-w>h
  vnoremap <M-j> <Esc><c-w>j
  vnoremap <M-k> <Esc><c-w>k
  vnoremap <M-l> <Esc><c-w>l
  " Normal mode:
  nnoremap <M-h> <c-w>h
  nnoremap <M-j> <c-w>j
  nnoremap <M-k> <c-w>k
  nnoremap <M-l> <c-w>l

  " Telescope
  nnoremap <leader>ff <cmd>Telescope find_files<cr>
  nnoremap <leader>fg <cmd>Telescope live_grep<cr>
  nnoremap <leader>fb <cmd>Telescope buffers<cr>
  nnoremap <leader>fh <cmd>Telescope help_tags<cr>

  " nvim-compe
  " inoremap <silent><expr> <C-Space> compe#complete()
  " inoremap <silent><expr> <CR>      compe#confirm('<CR>')
  " inoremap <silent><expr> <C-e>     compe#close('<C-e>')
  " inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
  " inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

  " set completeopt=menuone,noselect

  " let g:compe = {}
  " let g:compe.enabled = v:true
  " let g:compe.autocomplete = v:true
  " let g:compe.debug = v:false
  " let g:compe.min_length = 1
  " let g:compe.preselect = 'enable'
  " let g:compe.throttle_time = 80
  " let g:compe.source_timeout = 200
  " let g:compe.resolve_timeout = 800
  " let g:compe.incomplete_delay = 400
  " let g:compe.max_abbr_width = 100
  " let g:compe.max_kind_width = 100
  " let g:compe.max_menu_width = 100
  " let g:compe.documentation = v:true

  " let g:compe.source = {}
  " let g:compe.source.path = v:true
  " let g:compe.source.buffer = v:true
  " let g:compe.source.calc = v:true
  " let g:compe.source.nvim_lsp = v:true
  " let g:compe.source.nvim_lua = v:true
  " let g:compe.source.vsnip = v:true
  " let g:compe.source.ultisnips = v:true
  " let g:compe.source.luasnip = v:true
  " let g:compe.source.emoji = v:true
set completeopt=menu,menuone,noselect

lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
      end,
    },
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
     ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['pylsp'].setup {
    capabilities = capabilities
  }
EOF
endif
