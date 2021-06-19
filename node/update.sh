#!/bin/bash

source ~/.nvm/nvm.sh

CURRENT_NODE_VERSION=$(nvm ls | grep -Po -m 1 '\-\>\s+((iojs\-)?v\d+\.\d+\.\d+)' | grep -Po '(iojs\-)?v\d+\.\d+\.\d+')

nvm install --lts --default

NEXT_NODE_VERSION=$(nvm ls | grep -Po -m 1 '\-\>\s+((iojs\-)?v\d+\.\d+\.\d+)' | grep -Po '(iojs\-)?v\d+\.\d+\.\d+')

NODE_PATH=~/.nvm/versions/node/${NEXT_NODE_VERSION}/bin/node

nvm use ${NEXT_NODE_VERSION}

nvm alias default ${NEXT_NODE_VERSION}

nvm reinstall-packages ${CURRENT_NODE_VERSION}

if [ -f ~/.vimrc ]; then
  sed -i "s;let g:coc_node_path = '.*';let g:coc_node_path = '"$NODE_PATH"';g" ~/.vimrc
fi

if [ -d ~/.config/nvim ] && [ -f ~/.config/nvim/init.vim ]; then
  sed -i "s;let g:coc_node_path = '.*';let g:coc_node_path = '"$NODE_PATH"';g" ~/.config/nvim/init.vim
fi
