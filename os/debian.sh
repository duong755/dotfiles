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

function basic_packages() {
  apt-get install -y \
    automake \
    autoconf \
    gnupg gnupg-agent \
    apt-transport-https \
    ca-certificates \
    lsb-release \
    gettext \
    python3-pip \
    build-essential zlib1g-dev libffi-dev libssl-dev libbz2-dev libreadline-dev libsqlite3-dev liblzma-dev \
    openssl \
    curl \
    tree \
    xclip \
    jq \
    rsync \
    snapd
}

prepare
basic_packages

