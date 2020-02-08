call plug#begin('~/.vim/plugged')
" theme
Plug 'joshdick/onedark.vim'

" language
Plug 'sheerun/vim-polyglot'

" nerdtree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'jistr/vim-nerdtree-tabs'

" comment
Plug 'preservim/nerdcommenter'

" statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" autocomplete, intellisense
Plug 'Shougo/neco-vim'
Plug 'neoclide/coc-neco'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" git
Plug 'tpope/vim-fugitive'

" formatter
Plug 'sbdchd/neoformat'

" motions
Plug 'easymotion/vim-easymotion'

" js/ts/jsx/tsx
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" Rust
Plug 'rust-lang/rust.vim'
call plug#end()

" https://vim.fandom.com/wiki/Change_cursor_shape_in_different_modes
if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[1 q"' | redraw!
  au InsertEnter,InsertChange *
    \ if v:insertmode == 'i' | 
    \   silent execute '!echo -ne "\e[5 q"' | redraw! |
    \ elseif v:insertmode == 'r' |
    \   silent execute '!echo -ne "\e[3 q"' | redraw! |
    \ endif
  au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif

set encoding=UTF-8

set number

set cursorline

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

set guicursor=i:ver25-iCursor

syntax enable
syntax on

set termguicolors

colorscheme onedark

let g:airline_theme = 'onedark'

highlight Normal guibg=NONE ctermbg=NONE
