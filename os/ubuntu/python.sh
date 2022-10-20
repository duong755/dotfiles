#!/bin/bash

if [ $UID -ne "0" ]; then
  echo "Require root user"
  exit
fi

apt-get install -y \
  python3-pip \
  python3-apt \
  python3-venv \
  build-essential zlib1g-dev libffi-dev libssl-dev libbz2-dev libreadline-dev libsqlite3-dev liblzma-dev
