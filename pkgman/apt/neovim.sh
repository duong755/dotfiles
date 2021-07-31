#!/bin/bash

sudo add-apt-repository -y \
  ppa:neovim-ppa/unstable

sudo apt update -y
sudo apt upgrade -y

sudo apt install -y \
  neovim \
  python3-neovim
