#!/bin/bash

sudo apt-get -y update
sudo apt-get -y upgrade

sudo apt-get remove -y --purge apache* mysql* mariadb* php* dotnet*

sudo apt-get install -y \
  automake \
  autoconf \
  gnupg gnupg-agent \
  apt-transport-https \
  ca-certificates \
  lsb-release \
  gettext \
  openssl \
  curl \
  tree \
  xclip \
  jq

