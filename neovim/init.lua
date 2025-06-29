vim.call('plug#begin', '~/.config/nvim/plugged')

local Plug = vim.fn['plug#']
Plug('joshdick/onedark.vim')
Plug('editorconfig/editorconfig-vim')
Plug('sheerun/vim-polyglot')
Plug('christoomey/vim-tmux-navigator')
Plug('tpope/vim-fugitive')
Plug('tpope/vim-surround')
Plug('airblade/vim-gitgutter')
Plug('preservim/nerdtree')
Plug('Xuyuanp/nerdtree-git-plugin')
Plug('jistr/vim-nerdtree-tabs')
Plug('easymotion/vim-easymotion')
Plug('preservim/nerdcommenter')
Plug('vim-airline/vim-airline')
Plug('vim-airline/vim-airline-themes')
Plug('ryanoasis/vim-devicons')
Plug('dense-analysis/ale')
Plug('prabirshrestha/vim-lsp')
Plug('mattn/vim-lsp-settings')
Plug('prabirshrestha/asyncomplete.vim')
Plug('junegunn/seoul256.vim')

vim.call('plug#end')

vim.cmd [[
    colorscheme seoul256
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
set.guifont = 'JetBrainsMono_Nerd_Font:h12'
set.background = 'light'
set.omnifunc = 'ale#completion#OmniFunc'

vim.wo.colorcolumn = '120'

vim.g.mapleader = ' ' -- space

-- editorconfig
vim.g['EditorConfig_exclude_patterns'] = { 'fugitive://.*', 'scp://.*' }
vim.g['loaded_EditorConfig'] = 1

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

-- vim-test
vim.cmd("let test#strategy = 'neovim'")

vim.g['loaded_ruby_provider'] = 0
vim.g['loaded_perl_provider'] = 0

vim.api.nvim_create_autocmd('FileType', {
    pattern = 'makefile',
    command = 'setlocal expandtab=0'
})
vim.api.nvim_create_autocmd('BufNewFile', {
    pattern = '*.latexmkrc,latexmkrc',
    command = 'set filetype=perl'
})
vim.api.nvim_create_autocmd('BufRead', {
    pattern = '*.latexmkrc,latexmkrc',
    command = 'set filetype=perl'
})
vim.api.nvim_create_autocmd('BufNewFile', {
    pattern = '*.cls,*.sty',
    command = 'set filetype=tex'
})
vim.api.nvim_create_autocmd('BufRead', {
    pattern = '*.cls,*.sty',
    command = 'set filetype=tex'
})

vim.keymap.set('n', '<leader>ntf', ':<C-u>NERDTreeFocus<CR>')
vim.keymap.set('n', '<leader>nto', ':<C-u>NERDTree<CR>')
vim.keymap.set('n', '<leader>ntc', ':<C-u>NERDTreeClose<CR>')
vim.keymap.set('n', '<leader>nta', ':<C-u>NERDTreeToggle<CR>')

vim.keymap.set('n', '<leader>ntto', ':<C-u>NERDTreeTabsOpen<CR>')
vim.keymap.set('n', '<leader>nttc', ':<C-u>NERDTreeTabsClose<CR>')
vim.keymap.set('n', '<leader>nttt', ':<C-u>NERDTreeTabsToggle<CR>)')

vim.keymap.set('n', '<leader>tn', ':<C-u>TestNearest<CR>')
vim.keymap.set('n', '<leader>tf', ':<C-u>TestFile<CR>')
vim.keymap.set('n', '<leader>ts', ':<C-u>TestSuite<CR>')
vim.keymap.set('n', '<leader>tl', ':<C-u>TestLast<CR>')
vim.keymap.set('n', '<leader>tv', ':<C-u>TestVisit<CR>')

vim.keymap.set('n', '<leader><C-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<leader><C-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<leader><C-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<leader><C-l>', ':wincmd l<CR>')
