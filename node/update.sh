#!/usr/bin/bash

source ${HOME}/.nvm/nvm.sh

nvm install --lts --default

NODE_VERSION=$(nvm ls | grep -Po -m 1 '\-\>\s+(v\d{1,2}\.\d{1,2}\.\d{1,2})' | grep -Po 'v\d{1,2}\.\d{1,2}\.\d{1,2}')

NODE_PATH=${HOME}/.nvm/versions/node/${NODE_VERSION}/bin/node

sed -i "s;let g:coc_node_path = '.*';let g:coc_node_path = '"$NODE_PATH"';g" ~/.vimrc
