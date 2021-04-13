#!/usr/bin/bash

source ~/.nvm/nvm.sh

nvm install --lts --default

NODE_VERSION=$(nvm ls | grep -Po -m 1 '\-\>\s+(v\d{1,2}\.\d{1,2}\.\d{1,2})' | grep -Po 'v\d{1,2}\.\d{1,2}\.\d{1,2}')

NODE_PATH=~/.nvm/versions/node/${NODE_VERSION}/bin/node

nvm use $NODE_VERSION

nvm alias default $NODE_VERSION

sed -i "s;let g:coc_node_path = '.*';let g:coc_node_path = '"$NODE_PATH"';g" ~/.vimrc
sed -i "s;let g:coc_node_path = '.*';let g:coc_node_path = '"$NODE_PATH"';g" ~/.config/nvim/init.vim
