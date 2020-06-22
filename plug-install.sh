#!/usr/bin/env sh

CURRENT_FILE_PATH=$(realpath "$0")
CURRENT_DIRECTORY_PATH=$(dirname "$CURRENT_FILE_PATH")

if [ ! -d ~/.vim/plugged ]; then
  mkdir -p ~/.vim/plugged
fi

VIMPLUG_URL="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

install()
{
  CONFIG=""
  CONFIG_DIR=""
  VIMPLUG=""

  case $1 in
    vim)
      CONFIG=~/.vimrc
      CONFIG_DIR=~/.vim
      VIMPLUG=~/.vim/autoload/plug.vim
      ;;
    nvim)
      CONFIG=~/.config/nvim/init.vim
      CONFIG_DIR=~/.config/nvim
      VIMPLUG_NVIM=~/.local/share/nvim/site/autoload/plug.vim
      ;;
    neovim)
      CONFIG=~/.config/nvim/init.vim
      CONFIG_DIR=~/.config/nvim
      VIMPLUG_NVIM=~/.local/share/nvim/site/autoload/plug.vim
      ;;
    *)
      echo "Please select one of these editor: vim, nvim, neovim"
      exit 1
      ;;
  esac

  if [ ! -f ${VIMPLUG} ]; then
    curl -fLo ${VIMPLUG} --create-dirs ${VIMPLUG_URL}
  fi

  if [ ! -d ${CONFIG_DIR} ]; then
    mkdir -p ${CONFIG_DIR}
  fi

  case $2 in
    all)
      cp "${CURRENT_DIRECTORY_PATH}/init.vim" "${CONFIG}"
      cp "${CURRENT_DIRECTORY_PATH}/coc-settings.json" ~/.config/nvim/coc-settings.json
      ;;
    minimal)
      cp "${CURRENT_DIRECTORY_PATH}/minimal.vim" ~/.config/nvim/init.vim
      cp "${CURRENT_DIRECTORY_PATH}/coc-settings.json" ~/.config/nvim/coc-settings.json
      ;;
    plain)
      cp "${CURRENT_DIRECTORY_PATH}/plain.vim" ~/.config/nvim/init.vim
      ;;
    *)
      echo "Scheme $1 is not available. Select one of these: all, minimal, plain"
      exit 1
      ;;
  esac

  case $1 in
    vim)
      vim +PlugInstall +qall
      vim +CocInstall coc-json coc-emmet coc-highlight coc-pairs coc-html coc-css coc-eslint coc-tsserver coc-angular coc-rls coc-python coc-ccls +qall
      ;;
    nvim)
      vim +PlugInstall +qall
      vim +CocInstall coc-json coc-emmet coc-highlight coc-pairs coc-html coc-css coc-eslint coc-tsserver coc-angular coc-rls coc-python coc-ccls +qall
      ;;
    neovim)
      vim +PlugInstall +qall
      vim +CocInstall coc-json coc-emmet coc-highlight coc-pairs coc-html coc-css coc-eslint coc-tsserver coc-angular coc-rls coc-python coc-ccls +qall
      ;;
    *)
      ;;
  esac
}

install $1 $2
