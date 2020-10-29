#!/bin/sh

CURRENT_FILE_PATH=$(realpath "$0")
CURRENT_DIRECTORY_PATH=$(dirname "$CURRENT_FILE_PATH")

sudo add-apt-repository -y ppa:git-core/ppa
sudo add-apt-repository -y ppa:jonathonf/vim

sudo apt -y update
sudo apt -y upgrade

sudo apt install -y \
  git \
  tree \
  xclip \
  python3-pip \
  python-apt \
  curl \
  jq \
  tmux \
  vim \
  fonts-powerline

cp "${CURRENT_DIRECTORY_PATH}/default.tmux.conf" ~/.tmux.conf
