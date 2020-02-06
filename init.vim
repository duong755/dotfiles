call plug#begin('~/.config/nvim/plugged')
Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdcommenter'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'tpope/vim-fugitive'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'sbdchd/neoformat'
Plug 'rust-lang/rust.vim'
call plug#end()

set encoding=UTF-8

set number

set tabstop=2
set shiftwidth=2
set expandtab

set splitbelow
set splitright

set showcmd

set showmatch

set autoindent

set incsearch
set hlsearch

set magic

set smarttab

set wrap

set guifont=DroidSansMono_Nerd_Font:h12

syntax enable
syntax on

set termguicolors

colorscheme onedark

let g:airline_theme = 'onedark'

highlight Normal guibg=NONE ctermbg=NONE
highlight link xmlEndTag xmlTag

