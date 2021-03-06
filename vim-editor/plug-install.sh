#!/bin/sh

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
  CONFIG=""
  CONFIG_DIR=""
  VIMPLUG=""

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
      echo "Please select one of these editors: vim, nvim, neovim."
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
      cp "${CURRENT_DIRECTORY_PATH}/coc-settings.json" "${CONFIG_DIR}/coc-settings.json"
      source ${HOME}/.nvm/nvm.sh
      NODE_VERSION=$(nvm ls | grep -Po -m 1 '\-\>\s+(v\d{1,2}\.\d{1,2}\.\d{1,2})' | grep -Po 'v\d{1,2}\.\d{1,2}\.\d{1,2}')
      NODE_PATH=${HOME}/.nvm/versions/node/${NODE_VERSION}/bin/node
      nvm use $NODE_VERSION
      nvm alias default $NODE_VERSION
      sed -i "s;let g:coc_node_path = '.*';let g:coc_node_path = '"$NODE_PATH"';g" ~/.vimrc
      ;;
    minimal)
      cp "${CURRENT_DIRECTORY_PATH}/minimal.vim" "${CONFIG}"
      cp "${CURRENT_DIRECTORY_PATH}/coc-settings.json" "${CONFIG_DIR}/coc-settings.json"
      ;;
    plain)
      cp "${CURRENT_DIRECTORY_PATH}/plain.vim" "${CONFIG}"
      ;;
    *)
      echo "Scheme '$1' is not available. Select one of these: all, minimal, plain."
      exit 1
      ;;
  esac

  case $1 in
    vim)
      vim +PlugInstall +qall
      vim +CocInstall coc-json coc-emmet coc-highlight coc-pairs coc-html coc-css coc-eslint coc-tsserver coc-git +qall
      ;;
    nvim | neovim)
      vim +PlugInstall +qall
      vim +CocInstall coc-json coc-emmet coc-highlight coc-pairs coc-html coc-css coc-eslint coc-tsserver coc-git +qall
      ;;
    *)
      ;;
  esac
}

install $1 $2
