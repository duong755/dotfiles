#!/bin/bash

if [ $UID -ne "0" ]; then
  echo "Require root user"
  exit
fi

apt-get install -y \
  python3-pip \
  python3-apt \
  python3-venv
