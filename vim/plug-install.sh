#!/bin/bash

CURRENT_FILE_PATH=$(realpath "$0")
CURRENT_DIRECTORY_PATH=$(dirname "$CURRENT_FILE_PATH")

cp "${CURRENT_DIRECTORY_PATH}/default.tmux.conf" ~/.tmux.conf

if [ ! -d ~/.vim/plugged ]; then
  mkdir -p ~/.vim/plugged
fi

if [ ! -d ~/.vim/autoload ]; then
  mkdir -p ~/.vim/autoload
fi

VIMPLUG_URL="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

install() {
  local CONFIG=""
  local CONFIG_DIR=""
  local VIMPLUG=""

  case $1 in
    vim)
      CONFIG=~/.vimrc
      CONFIG_DIR=~/.vim
      VIMPLUG=~/.vim/autoload/plug.vim
      ;;
    nvim | neovim)
      CONFIG=~/.config/nvim/init.vim
      CONFIG_DIR=~/.config/nvim
      VIMPLUG=~/.local/share/nvim/site/autoload/plug.vim
      ;;
    *)
      echo "Select one of these editors: vim, nvim, neovim."
      exit 1
      ;;
  esac

  if [ ! -f ${VIMPLUG} ]; then
    wget -qO ${VIMPLUG} ${VIMPLUG_URL}
  fi

  if [ ! -d ${CONFIG_DIR} ]; then
    mkdir -p ${CONFIG_DIR}
  fi

  case $2 in
    all)
      cp "${CURRENT_DIRECTORY_PATH}/init.vim" "${CONFIG}"
      cp "${CURRENT_DIRECTORY_PATH}/coc-settings.json" "${CONFIG_DIR}/coc-settings.json"
      # shellcheck disable=SC1090
      source ~/.nvm/nvm.sh
      local NODE_VERSION
      NODE_VERSION=$(nvm ls | grep -Po -m 1 '\-\>\s+(v\d{1,2}\.\d{1,2}\.\d{1,2})' | grep -Po 'v\d{1,2}\.\d{1,2}\.\d{1,2}')
      local NODE_PATH
      NODE_PATH=~/.nvm/versions/node/${NODE_VERSION}/bin/node

      nvm use "${NODE_VERSION}"
      nvm alias default "${NODE_VERSION}"

      if [ -f ~/.vimrc ]; then
        sed -i "s;let g:coc_node_path = '.*';let g:coc_node_path = '$NODE_PATH';g" ~/.vimrc
      fi

      if [ -f ~/.config/nvim/init.vim ]; then
        sed -i "s;let g:coc_node_path = '.*';let g:coc_node_path = '$NODE_PATH';g" ~/.config/nvim/init.vim
      fi
      ;;
    minimal)
      cp "${CURRENT_DIRECTORY_PATH}/minimal.vim" "${CONFIG}"
      cp "${CURRENT_DIRECTORY_PATH}/coc-settings.json" "${CONFIG_DIR}/coc-settings.json"
      ;;
    plain)
      cp "${CURRENT_DIRECTORY_PATH}/plain.vim" "${CONFIG}"
      ;;
    *)
      echo "Scheme '$2' is not available. Select one of these: all, minimal, plain."
      exit 1
      ;;
  esac

  case $1 in
    vim)
      vim +PlugInstall +qall
      vim +CocInstall coc-json coc-emmet coc-highlight coc-pairs coc-html coc-css coc-eslint coc-tsserver coc-git coc-metals +qall
      ;;
    nvim | neovim)
      vim +PlugInstall +qall
      vim +CocInstall coc-json coc-emmet coc-highlight coc-pairs coc-html coc-css coc-eslint coc-tsserver coc-git coc-metals +qall
      ;;
    *)
      echo "Select one of these editors: vim, nvim, neovim."
      ;;
  esac
}

install "$1" "$2"
