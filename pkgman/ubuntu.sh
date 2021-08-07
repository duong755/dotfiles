#!/bin/bash

bash ./ubuntu/basic.sh
bash ./ubuntu/neovim.sh
bash ./ubuntu/python.sh
bash ./ubuntu/desktop.sh

sudo apt install -y \
  cpanminus \
  freeglut3 \
  deja-dup \
  shellcheck
