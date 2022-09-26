" vim-polyglot
let g:polyglot_disabled = ['latex']

call plug#begin('~/.vim/plugged')
" theme
Plug 'joshdick/onedark.vim'
" editorconfig
Plug 'editorconfig/editorconfig-vim'
" syntax highlight
Plug 'sheerun/vim-polyglot'
" navigator
Plug 'christoomey/vim-tmux-navigator'
" git
Plug 'tpope/vim-fugitive'
" nerdtree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jistr/vim-nerdtree-tabs'
" easymotion
Plug 'easymotion/vim-easymotion'
" comment
Plug 'preservim/nerdcommenter'
" statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" file icon
Plug 'ryanoasis/vim-devicons'
" autocomplete, intellisense
Plug 'Shougo/neco-vim'
Plug 'neoclide/coc-neco'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
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

let g:coc_node_path = ''
let g:coc_disable_startup_warning = 1

" editorconfig-vim
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
let g:loaded_EditorConfig = 1

" nerdtree
let g:NERDTreeWinSize = 24
let g:NERDTreeGitStatusEnable = 1

" tmux navigator
let g:tmux_navigator_save_on_switch = 2

" nerdcommenter
let g:NERDSpaceDelims = 1

" multiple-cursors
let g:multi_cursor_quit_key="<Esc>"

" airline, airline-theme
let g:airline_theme = 'onedark'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1

" latex
let g:tex_flavor = 'latex'

autocmd FileType cs,java,python,tex,makefile,xml setlocal shiftwidth=4 tabstop=4
autocmd FileType makefile setlocal expandtab=0
autocmd VimEnter,BufNewFile,BufRead *.cls set filetype=tex
autocmd VimEnter,BufNewFile,BufRead *.sty set filetype=tex
autocmd VimEnter,BufNewFile,BufRead *.latexmkrc,latexmkrc set filetype=perl
autocmd VimEnter,BufNewFile,BufRead *.cshtml set filetype=html

map <F3> :let @/ = ""<CR>

" keymap for coc.nvim
inoremap <silent><expr> <C-Space> coc#refresh()
nnoremap <silent><space>d :<C-u>CocDisable<CR>
nnoremap <silent><space>a :<C-u>CocList diagnostics<CR>
nnoremap <silent><space>e :<C-u>CocList extensions<CR>
nnoremap <silent><space>c :<C-u>CocList commands<CR>
nnoremap <silent><space>o :<C-u>CocList outline<CR>
nnoremap <silent><space>s :<C-u>CocList -I symbols<CR>
nnoremap <silent><space>p :<C-u>CocListResume<CR>
nnoremap <silent> gd <Plug>(coc-definition)

" keymap for nerdtree and nerdtree tab
nnoremap <silent>ntf  :<C-u>NERDTreeFocus<CR>
nnoremap <silent>ntto :<C-u>NERDTreeTabsOpen<CR>
nnoremap <silent>nttc :<C-u>NERDTreeTabsClose<CR>
nnoremap <silent>nttt :<C-u>NERDTreeTabsToggle<CR>

" keymap for coc-metals
nnoremap <silent>mtvp :call CocAction('runCommand', 'metals.tvp')<CR>

highlight Normal guibg=NONE ctermbg=NONE
