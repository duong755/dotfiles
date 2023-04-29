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
    gnupg \
    ca-certificates \
    gettext \
    python3-pip \
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
