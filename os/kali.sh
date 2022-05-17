#!/bin/bash

if [ $UID -ne "0" ]; then
  echo "Require root user"
  exit
fi

function prepare() {
  apt-get -y update
  apt-get -y upgrade

  apt-get -y dist-upgrade

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
    python3-venv \
    openssl \
    curl \
    tree \
    xclip \
    jq \
    rsync \
    freeglut3 \
    snapd
}

prepare
basic_packages

# install git
CURRENT_FILE_PATH=$(realpath "$0")
CURRENT_DIR_PATH=$(dirname "$CURRENT_FILE_PATH")

bash "${CURRENT_DIR_PATH}"/kali/git.sh

