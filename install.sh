#!/usr/bin/env sh

CURRENT_FILE_PATH=$(realpath "$0")
CURRENT_DIRECTORY_PATH=$(dirname "$CURRENT_FILE_PATH")

sudo add-apt-repository -y ppa:git-core/ppa
sudo add-apt-repository -y ppa:neovim-ppa/unstable
sudo add-apt-repository -y ppa:jonathonf/vim
sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test

sudo apt -y update
sudo apt -y upgrade

sudo apt install -y \
  git \
  tree \
  xclip \
  python-pip \
  python3-pip \
  curl \
  tmux \
  neovim \
  vim \
  fonts-powerline

cp "${CURRENT_DIRECTORY_PATH}/default.tmux.conf" ~/.tmux.conf

sh "${CURRENT_DIRECTORY_PATH}/python-install.sh"
sh "${CURRENT_DIRECTORY_PATH}/node-install.sh"
sh "${CURRENT_DIRECTORY_PATH}/plug-install.sh"

