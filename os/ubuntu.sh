#!/bin/bash

CURRENT_FILE_PATH=$(realpath $0)
CURRENT_DIR_PATH=$(dirname "$CURRENT_FILE_PATH")

bash ${CURRENT_DIR_PATH}/ubuntu/basic.sh
bash ${CURRENT_DIR_PATH}/ubuntu/neovim.sh
bash ${CURRENT_DIR_PATH}/ubuntu/python.sh
bash ${CURRENT_DIR_PATH}/ubuntu/desktop.sh

sudo apt install -y \
  cpanminus \
  freeglut3 \
  deja-dup \
  shellcheck
