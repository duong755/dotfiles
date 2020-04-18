call plug#begin('~/.vim/plugged')
" theme
Plug 'joshdick/onedark.vim'
" editorconfig
Plug 'editorconfig/editorconfig-vim'
" syntax highlight
Plug 'sheerun/vim-polyglot'
" lint
Plug 'dense-analysis/ale'
" nerdtree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jistr/vim-nerdtree-tabs'
" navigator
Plug 'christoomey/vim-tmux-navigator'
" comment
Plug 'preservim/nerdcommenter'
" multiple cursors
Plug 'terryma/vim-multiple-cursors'
" statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" file icon
Plug 'ryanoasis/vim-devicons'
" autocomplete, intellisense
Plug 'Shougo/neco-vim'
Plug 'neoclide/coc-neco'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
" git
Plug 'tpope/vim-fugitive'
" formatter
Plug 'sbdchd/neoformat'
Plug 'prettier/vim-prettier'
" js/ts/jsx/tsx
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
" jsonc
Plug 'neoclide/jsonc.vim'
" Rust
Plug 'rust-lang/rust.vim'
" Csharp
Plug 'OmniSharp/omnisharp-vim'
call plug#end()

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

colorscheme onedark

" vim-polyglot
let g:polyglot_disabled = ['latex']

" editorconfig-vim
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
let g:loaded_EditorConfig = 1

" nerdtree
let g:NERDTreeWinSize = 24
let g:NERDTreeShowGitStatus = 1

" tmux navigator
let g:tmux_navigator_save_on_switch = 2

" nerdcommenter
let g:NERDSpaceDelims = 1

" vista
let g:vista#renderer#enable_icon = 1
let g:vista#executive#ctags#support_json_format = 1

" multiple-cursors
let g:multi_cursor_quit_key="<Esc>"

" airline, airline-theme
let g:airline_theme = 'onedark'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_powerline_fonts = 1

" latex
let g:tex_flavor = 'latex'

" csharp
let g:OmniSharp_highlight_types = 3

au FileType sql :CocDisable
au FileType cs,java,python setlocal shiftwidth=4 tabstop=4
au BufNewFile,BufRead *.cshtml set filetype=html

map <F3> :set nohlsearch!<CR>

" format
nnoremap <silent> <C-f>p :<C-u>Prettier<CR>
nnoremap <silent> <C-f>n :<C-u>Neoformat<CR>
nnoremap <silent> <C-f>r :<C-u>RustFmt<CR>

" keymap for coc.nvim
inoremap <silent><expr> <C-Space> coc#refresh()
nnoremap <silent> <space>d  :<C-u>CocDisable<CR>
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<CR>
nnoremap <silent> <space>e  :<C-u>CocList extensions<CR>
nnoremap <silent> <space>c  :<C-u>CocList commands<CR>
nnoremap <silent> <space>o  :<C-u>CocList outline<CR>
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<CR>
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
nmap <silent> gd <Plug>(coc-definition)

" keymap for nerdtree and nerdtree tab
nnoremap <silent> <space>tf  :<C-u>NERDTreeFocus<CR>
nnoremap <silent> <space>tto :<C-u>NERDTreeTabsOpen<CR>
nnoremap <silent> <space>ttc :<C-u>NERDTreeTabsClose<CR>
nnoremap <silent> <space>ttt :<C-u>NERDTreeTabsToggle<CR>

highlight Normal guibg=NONE ctermbg=NONE
