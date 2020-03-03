call plug#begin('~/.vim/plugged')
" theme
Plug 'joshdick/onedark.vim'

" editorconfig
Plug 'editorconfig/editorconfig-vim'

" syntax highlight
Plug 'sheerun/vim-polyglot'

" nerdtree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jistr/vim-nerdtree-tabs'

" navigator
Plug 'christoomey/vim-tmux-navigator'

" outline
Plug 'liuchengxu/vista.vim'

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
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'Shougo/neco-vim'
Plug 'neoclide/coc-neco'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" git
Plug 'tpope/vim-fugitive'

" formatter
Plug 'sbdchd/neoformat'
Plug 'prettier/vim-prettier'

" motions
Plug 'easymotion/vim-easymotion'

" js/ts/jsx/tsx/mdx
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'jxnblk/vim-mdx-js'

" jsonc
Plug 'neoclide/jsonc.vim'

" Rust
Plug 'rust-lang/rust.vim'

" Java
Plug 'artur-shaik/vim-javacomplete2'

" Csharp
Plug 'OmniSharp/omnisharp-vim'

" LaTeX
Plug 'lervag/vimtex'
call plug#end()

" https://vim.fandom.com/wiki/Change_cursor_shape_in_different_modes
if has("autocmd")
  if !has("nvim")
    au VimEnter,InsertLeave * silent execute '!echo -ne "\e[1 q"' | redraw!
    au InsertEnter,InsertChange *
      \ if v:insertmode == 'i' | 
      \   silent execute '!echo -ne "\e[5 q"' | redraw! |
      \ elseif v:insertmode == 'r' |
      \   silent execute '!echo -ne "\e[3 q"' | redraw! |
      \ endif
    au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
  endif
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

set autoindent
set autoread

set guifont=DroidSansMono_Nerd_Font:h12

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

" nerdcommenter
let g:NERDSpaceDelims = 1

" vista
let g:vista#renderer#enable_icon = 1
let g:vista#executive#ctags#support_json_format = 1

" multiple-cursors
let g:multi_cursor_quit_key="<Esc>"

" airline, airline-theme
let g:airline_theme = 'onedark'

" latex
let g:tex_flavor = 'latex'

" java
filetype plugin indent on  
set omnifunc=syntaxcomplete#Complete
au FileType java setlocal omnifunc=javacomplete#Complete
nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
imap <F4> <Plug>(JavaComplete-Imports-AddSmart)
nmap <F5> <Plug>(JavaComplete-Imports-Add)
imap <F5> <Plug>(JavaComplete-Imports-Add)
nmap <F6> <Plug>(JavaComplete-Imports-AddMissing)
imap <F6> <Plug>(JavaComplete-Imports-AddMissing)
nmap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
imap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)

" deoplete

let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_completion_start_length = 2
let g:deoplete#sources = {}
let g:deoplete#sources._ = []
let g:deoplete#file#enable_buffer_path = 1

" csharp
let g:OmniSharp_highlight_types = 3

au FileType cs setlocal shiftwidth=4 tabstop=4
au BufRead,BufNewFile *.eslintrc set filetype=jsonc
au BufRead,BufNewFile *.prettierrc set filetype=jsonc
au BufNewFile,BufRead *.cshtml set filetype=html

highlight Normal guibg=NONE ctermbg=NONE
