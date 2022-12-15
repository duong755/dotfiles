vim.call('plug#begin', '~/.config/nvim/plugged')

local Plug = vim.fn['plug#']
Plug('joshdick/onedark.vim')
Plug('editorconfig/editorconfig-vim')
Plug('sheerun/vim-polyglot')
Plug('christoomey/vim-tmux-navigator')
Plug('tpope/vim-fugitive')
Plug('airblade/vim-gitgutter')
Plug('preservim/nerdtree')
Plug('Xuyuanp/nerdtree-git-plugin')
Plug('jistr/vim-nerdtree-tabs')
Plug('easymotion/vim-easymotion')
Plug('preservim/nerdcommenter')
Plug('vim-airline/vim-airline')
Plug('vim-airline/vim-airline-themes')
Plug('ryanoasis/vim-devicons')
Plug('autozimu/LanguageClient-neovim', { ['branch'] = 'next', ['do'] = 'bash install.sh' })
Plug('dense-analysis/ale')
Plug('Shougo/neco-vim')
Plug('neoclide/jsonc.vim')
Plug('sbdchd/neoformat')
Plug('prettier/vim-prettier')
Plug('pangloss/vim-javascript')
Plug('leafgarland/typescript-vim')
Plug('peitalin/vim-jsx-typescript')
Plug('tpope/vim-fireplace')
Plug('rust-lang/rust.vim')

vim.call('plug#end')

vim.cmd [[
    colorscheme onedark
    syntax on
    filetype plugin indent on
]]

local set = vim.opt

set.encoding = 'UTF-8'
set.number = true
set.cursorline = true
set.smartcase = true
set.autoread = true
set.tabstop = 2
set.shiftwidth = 2
set.expandtab = true
set.smarttab = true
set.smartindent = true
set.autoindent = true
set.wrap = true
set.splitbelow = true
set.splitright = true
set.showcmd = true
set.showmatch = true
set.magic = true
set.incsearch = true
set.hlsearch = true
set.foldmethod = 'manual'
set.guifont = 'Ubuntu_Mono_Nerd_Font_Complete:h12'
set.background = 'light'
set.omnifunc = 'ale#completion#OmniFunc'

vim.wo.colorcolumn = '120'

vim.g.mapleader = ' '

-- editorconfig
vim.g['EditorConfig_exclude_patterns'] = { 'fugitive://.*', 'scp://.*' }
vim.g['loaded_EditorConfig'] = 1

-- LanguageClient-neovim
vim.g['LanguageClient_serverCommands'] = {
    ['rust'] = { 'rust-analyzer' },
    ['tex'] = { 'texlab' },
    ['python'] = { 'pyls' },
    ['javascript'] = { 'typescript-language-server', '--stdio' },
    ['typescript'] = { 'typescript-language-server', '--stdio' },
    ['c'] = { 'ccls' },
    ['cpp'] = { 'ccls' }
}

-- nerdtree
vim.g['NERDTreeWinSize'] = 24
vim.g['NERDTreeGitStatusEnable'] = 1

-- tmux
vim.g['tmux_navigator_save_on_switch'] = 2

-- commenter
vim.g['NERDSpaceDelims'] = 1

-- airline
vim.g['airline_theme'] = 'onedark'
vim.g['airline#extensions#tabline#enabled'] = 1
vim.g['airline#extensions#tabline#formatter'] = 'default'
vim.g['airline#extensions#ale#enabled'] = 1
vim.g['airline_powerline_fonts'] = 0

-- latex
vim.g['tex_flavor'] = 'latex'

-- ale
vim.g['ale_completion_enabled'] = 1
vim.g['ale_completion_autoimport'] = 1
vim.g['ale_linters'] = {
    ['javascript'] = { 'eslint', 'prettier' },
    ['python'] = { 'black' }
}

vim.api.nvim_create_autocmd('FileType', {
    pattern = 'makefile',
    command = 'setlocal expandtab=0'
})
vim.api.nvim_create_autocmd('BufNewFile,BufRead', {
    pattern = '*.latexmkrc,latexmkrc',
    command = 'set filetype=perl'
})
vim.api.nvim_create_autocmd('BufNewFile,BufRead', {
    pattern = '*.cls',
    command = 'set filetype=tex'
})
vim.api.nvim_create_autocmd('BufNewFile,BufRead', {
    pattern = '*.sty',
    command = 'set filetype=tex'
})

vim.keymap.set('', '<F3>', ':let @/ = ""<CR>')

vim.keymap.set('n', '<leader>ntf', ':<C-u>NERDTreeFocus<CR>')
vim.keymap.set('n', '<leader>nto', ':<C-u>NERDTree<CR>')
vim.keymap.set('n', '<leader>ntc', ':<C-u>NERDTreeClose<CR>')
vim.keymap.set('n', '<leader>nta', ':<C-u>NERDTreeToggle<CR>')

vim.keymap.set('n', '<leader>ntto', ':<C-u>NERDTreeTabsOpen<CR>')
vim.keymap.set('n', '<leader>nttc', ':<C-u>NERDTreeTabsClose<CR>')
vim.keymap.set('n', '<leader>nttt', ':<C-u>NERDTreeTabsToggle<CR>)')

vim.keymap.set('n', '<leader><C-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<leader><C-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<leader><C-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<leader><C-l>', ':wincmd l<CR>')
