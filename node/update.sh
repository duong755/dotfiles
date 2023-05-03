#!/bin/bash

if [ ! -f "${HOME}/.nvm/nvm.sh" ]; then
  exit
fi

# shellcheck disable=SC1091
source "${HOME}/.nvm/nvm.sh"

CURRENT_NODE_VERSION=$(nvm ls | grep -Po -m 1 '\-\>\s+((iojs\-)?v\d+\.\d+\.\d+)' | grep -Po '(iojs\-)?v\d+\.\d+\.\d+')

nvm install --lts --default

NEXT_NODE_VERSION=$(nvm ls | grep -Po -m 1 '\-\>\s+((iojs\-)?v\d+\.\d+\.\d+)' | grep -Po '(iojs\-)?v\d+\.\d+\.\d+')
# NODE_PATH="${HOME}/.nvm/versions/node/${NEXT_NODE_VERSION}/bin/node"

nvm use "${NEXT_NODE_VERSION}"
nvm alias default "${NEXT_NODE_VERSION}"
nvm reinstall-packages "${CURRENT_NODE_VERSION}"

