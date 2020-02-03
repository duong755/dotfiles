set number

set tabstop=2
set shiftwidth=2
set expandtab

set showcmd

set cursorline

set showmatch

set autoindent

set incsearch
set hlsearch

set magic

set smarttab

set wrap

syntax enable

call plug#begin('~/.config/nvim/plugged')

Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jistr/vim-nerdtree-tabs'

Plug 'vim-scripts/Workspace-Manager'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'flrnd/plastic.vim'

Plug 'neoclide/coc.nvim', { 'branch': 'release' }

Plug 'itchyny/lightline.vim'

Plug 'tpope/vim-fugitive'

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'branch': 'release/1.x',
  \ 'for': [ 'javascript', 'typescript', 'css', 'less', 'scss', 'json', 'markdown', 'python', 'html', 'yaml' ]
  \}

Plug 'easymotion/vim-easymotion'

Plug 'rust-lang/rust.vim'
call plug#end()

set termguicolors

colorscheme plastic
hi Normal guibg=NONE ctermbg=NONE

highlight link xmlEndTag xmlTag

let g:lightline = { 'colorscheme': 'plastic' }
