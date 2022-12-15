#!/bin/bash

if [ $UID -ne "0" ]; then
  echo "Require root user"
  exit
fi

function prepare() {
  apt-get -y update
  apt-get -y upgrade

  apt-get autoremove -y
  apt-get autoclean -y
}

function install_packages() {
  apt-get install -y \
    software-properties-common \
    apt-transport-https \
    automake \
    autoconf \
    gnupg gnupg-agent \
    apt-transport-https \
    ca-certificates \
    lsb-release \
    gettext \
    python3-pip \
    python3-apt \
    build-essential zlib1g-dev libffi-dev libssl-dev libbz2-dev libreadline-dev libsqlite3-dev liblzma-dev \
    openssl \
    zip unzip \
    curl wget \
    tree \
    xclip \
    jq \
    rsync \
    snapd
}

prepare
install_packages
