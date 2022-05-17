#!/bin/bash

if [ $UID -ne "0" ]; then
  echo "Require root user"
  exit
fi

add-apt-repository -y \
  ppa:git-core/ppa \
  ppa:jonathonf/vim

apt-get -y update
apt-get -y upgrade

apt-get install -y \
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
