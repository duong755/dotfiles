set encoding=UTF-8

set number

set cursorline

set smartcase

set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set smartindent

set splitbelow
set splitright

set showcmd

set showmatch

set autoindent

set incsearch
set hlsearch

set magic

set wrap

set autoindent
set autoread

set guifont=Ubuntu_Mono_Nerd_Font_Complete:h12

set guicursor=i:ver25-iCursor

syntax enable
syntax on

set termguicolors

au FileType cs,java,python,tex,makefile setlocal shiftwidth=4 tabstop=4
au FileType makefile setlocal expandtab=0
au BufNewFile,BufRead *.latexmkrc,latexmkrc set filetype=perl
au BufNewFile,BufRead *.cshtml set filetype=html

map <F3> :set nohlsearch!<CR>

highlight Normal guibg=NONE ctermbg=NONE
