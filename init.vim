call plug#begin('~/.config/nvim/plugged')
Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'preservim/nerdcommenter'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'vim-scripts/Workspace-Manager'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'sbdchd/neoformat'
Plug 'easymotion/vim-easymotion'
Plug 'rust-lang/rust.vim'
call plug#end()

set number

set tabstop=2
set shiftwidth=2
set expandtab

set showcmd

set showmatch

set autoindent

set incsearch
set hlsearch

set magic

set smarttab

set wrap

syntax enable

set termguicolors

colorscheme onedark
hi Normal guibg=NONE ctermbg=NONE

highlight link xmlEndTag xmlTag

let g:lightline = { 'colorscheme': 'onedark' }
let g:airline_theme = 'onedark'

