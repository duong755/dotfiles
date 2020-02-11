#!/usr/bin/env sh

if [ ! -d ~/.ctags.d ]; then
  mkdir -p ~/.ctags.d
fi
cp ./defaults.ctags ~/.ctags.d/default.ctags

if [ ! -d ~/.vim/plugged ]; then
  mkdir -p ~/.vim/plugged
fi

VIMPLUG_URL=https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# for vim
VIMPLUG_VIM=~/.vim/autoload/plug.vim
if [ ! -f "$VIMPLUG_VIM" ]; then
  curl -fLo $VIMPLUG_VIM --create-dirs $VIMPLUG_URL
fi
cp ./init.vim ~/.vimrc
cp ./coc-settings.json ~/.vim/coc-settings.json

# for neovim
VIMPLUG_NVIM=~/.local/share/nvim/site/autoload/plug.vim
if [ ! -f "$VIMPLUG_NVIM" ]; then
  curl -fLo $VIMPLUG_NVIM --create-dirs $VIMPLUG_URL
fi

if [ ! -d ~/.config/nvim ]; then
  mkdir -p ~/.config/nvim
fi
cp ./init.vim ~/.config/nvim/init.vim
cp ./coc-settings.json ~/.config/nvim/coc-settings.json

vim +PlugInstall +qall
vim +CocInstall coc-json coc-emmet coc-highlight coc-pairs coc-snippets coc-html coc-css coc-eslint coc-tsserver coc-angular coc-eslint coc-rls coc-python coc-ccls +qall
