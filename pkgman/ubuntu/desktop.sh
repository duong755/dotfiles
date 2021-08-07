#!/bin/bash

sudo add-apt-repository -y \
  ppa:bamboo-engine/ibus-bamboo

sudo apt update -y
sudo apt upgrade -y

sudo apt install -y \
  tmux \
  deja-dup \
  ibus-bamboo

