#!/usr/bin/env sh

CURRENT_FILE_PATH=$(realpath "$0")
CURRENT_DIRECTORY_PATH=$(dirname "$CURRENT_FILE_PATH")

if [ ! -d ~/.vim/plugged ]; then
  mkdir -p ~/.vim/plugged
fi

VIMPLUG_URL="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

# for vim
VIMPLUG_VIM=~/.vim/autoload/plug.vim
if [ ! -f "$VIMPLUG_VIM" ]; then
  curl -fLo $VIMPLUG_VIM --create-dirs $VIMPLUG_URL
fi
cp "${CURRENT_DIRECTORY_PATH}/init.vim" ~/.vimrc
cp "${CURRENT_DIRECTORY_PATH}/coc-settings.json" ~/.vim/coc-settings.json

# for neovim
VIMPLUG_NVIM=~/.local/share/nvim/site/autoload/plug.vim
if [ ! -f "$VIMPLUG_NVIM" ]; then
  curl -fLo $VIMPLUG_NVIM --create-dirs $VIMPLUG_URL
fi

if [ ! -d ~/.config/nvim ]; then
  mkdir -p ~/.config/nvim
fi
cp "${CURRENT_DIRECTORY_PATH}/init.vim" ~/.config/nvim/init.vim
cp "${CURRENT_DIRECTORY_PATH}/coc-settings.json" ~/.config/nvim/coc-settings.json

vim +PlugInstall +qall
vim +CocInstall coc-json coc-emmet coc-highlight coc-pairs coc-html coc-css coc-eslint coc-tsserver coc-angular coc-eslint coc-rls coc-python coc-ccls +qall
