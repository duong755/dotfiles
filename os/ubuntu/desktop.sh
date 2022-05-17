#!/bin/bash

if [ $UID -ne "0" ]; then
  echo "Require root user"
  exit
fi

add-apt-repository -y \
  ppa:bamboo-engine/ibus-bamboo

apt-get update -y
apt-get upgrade -y

apt-get install -y \
  tmux \
  deja-dup \
  ibus-bamboo

