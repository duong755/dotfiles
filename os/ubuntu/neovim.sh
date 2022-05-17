#!/bin/bash

if [ $UID -ne "0" ]; then
  echo "Require root user"
  exit
fi

add-apt-repository -y \
  ppa:neovim-ppa/unstable

apt-get update -y
apt-get upgrade -y

apt-get install -y \
  neovim \
  python3-neovim
