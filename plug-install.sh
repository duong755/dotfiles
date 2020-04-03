#!/usr/bin/env sh

CURRENT_FILE_PATH=$(realpath "$0")
CURRENT_DIRECTORY_PATH=$(dirname "$CURRENT_FILE_PATH")

# install font

if [ ! -f "/usr/local/share/fonts/Ubuntu Mono Nerd Font Complete Mono.ttf" ]; then
  NERD_FONTS_LATEST_VERSION=$(wget -qO- https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest | grep -Po -m 1 '(v\d+\.\d+\.\d+)(?!name)')
  echo "Downloading latest version of UbuntuMono..."

  wget -O "${CURRENT_DIRECTORY_PATH}/UbuntuMono.zip" "https://github.com/ryanoasis/nerd-fonts/releases/download/${NERD_FONTS_LATEST_VERSION}/UbuntuMono.zip"
  echo "Downloaded UbuntuMono. Extracting..."

  sudo unzip -f "${CURRENT_DIRECTORY_PATH}/UbuntuMono.zip" -d "/usr/local/share/fonts"
  echo "Extracted to /usr/local/share/fonts"

  rm -f "UbuntuMono.zip"
fi

if [ ! -f "/usr/local/share/fonts/Ubuntu Mono derivative Powerline.ttf" ]; then
  sudo wget -O "/usr/local/share/fonts/Ubuntu Mono derivative Powerline.ttf" "https://raw.githubusercontent.com/powerline/fonts/master/UbuntuMono/Ubuntu Mono derivative Powerline.ttf"
fi

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
VIMPLUG_NVIM="~/.local/share/nvim/site/autoload/plug.vim"
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
