#!/bin/bash

sudo add-apt-repository -y \
  ppa:git-core/ppa \
  ppa:jonathonf/vim \
  ppa:neovim-ppa/unstable \
  ppa:bamboo-engine/ibus-bamboo

sudo apt -y update
sudo apt -y upgrade

sudo apt install -y \
  software-properties-common \
  zip \
  unzip \
  git \
  tree \
  xclip \
  curl \
  apt-transport-https \
  gnupg-agent \
  ibus-bamboo \
  jq \
  tmux \
  vim \
  neovim \
  python3-pip \
  python3-apt \
  python3-neovim \
  python3-venv \
  fonts-powerline \
  cpanminus \
  freeglut3 \
  deja-dup \
  shellcheck
