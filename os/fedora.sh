#!/bin/bash

if [ $UID -ne "0" ]; then
  echo "Require root user"
  exit
fi

function prepare() {
  dnf -y upgrade

  dnf autoremove -y
  dnf clean all
}

function install_packages() {
  dnf install -y \
    automake \
    autoconf \
    gnupg gnupg-agent \
    ca-certificates \
    gettext \
    python3-pip \
    build-essential zlib1g-dev libffi-dev libssl-dev libbz2-dev libreadline-dev libsqlite3-dev liblzma-dev \
    openssl \
    zip unzip gunzip \
    curl wget \
    tree \
    xclip \
    jq \
    rsync \
    snapd
}

prepare
install_packages
