#!/usr/bin/env sh

CURRENT_FILE_PATH=$(realpath "$0")
CURRENT_DIRECTORY_PATH=$(dirname "$CURRENT_FILE_PATH")

FONT=fc-list | grep "/usr/local/share/fonts/Droid Sans Mono Nerd Font Complete.otf"

if [ ! -z $FONT ]; then
  NERD_FONTS_LATEST_VERSION=$(wget -qO- https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest | grep -Po -m 1 '(v\d+\.\d+\.\d+)(?!name)')
  echo "Downloading latest version of DroidSansMono..."

  wget -O "${CURRENT_DIRECTORY_PATH}/DroidSansMono.zip" "https://github.com/ryanoasis/nerd-fonts/releases/download/${NERD_FONTS_LATEST_VERSION}/DroidSansMono.zip" \
  && echo "Downloaded DroidSansMono. Extracting..." \
  && unzip -f "${CURRENT_DIRECTORY_PATH}/DroidSansMono.zip" -d /usr/local/share/fonts \
  && rm -f "${CURRENT_DIRECTORY_PATH}/DroidSansMono.zip"
fi

if [ ! -d ~/.ctags.d ]; then
  mkdir -p ~/.ctags.d
fi
cp "${CURRENT_DIRECTORY_PATH}/defaults.ctags" ~/.ctags.d/default.ctags

if [ ! -d ~/.vim/plugged ]; then
  mkdir -p ~/.vim/plugged
fi

VIMPLUG_URL=https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

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
vim +CocInstall coc-json coc-emmet coc-highlight coc-pairs coc-snippets coc-html coc-css coc-eslint coc-tsserver coc-angular coc-eslint coc-rls coc-python coc-ccls coc-vimtex +qall
