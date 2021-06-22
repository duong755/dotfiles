#!/bin/bash

sudo add-apt-repository -y \
  ppa:git-core/ppa \
  ppa:jonathonf/vim

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
  jq \
  vim \
  fonts-powerline
