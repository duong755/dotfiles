#!/bin/bash

if [ $UID -ne "0" ]; then
  echo "Require root user"
  exit
fi

GIT_LATEST_VERSION=$(curl -sL https://www.kernel.org/pub/software/scm/git/ | grep -Po "(?<=\")git-\d+\.\d+\.\d+\.tar\.xz" | xargs python3 git.py)
# echo $GIT_LATEST_VERSION

apt-get install -y \
  dh-autoreconf \
  libcurl4-gnutls-dev \
  libcurl4-openssl-dev \
  libexpat1-dev \
  gettext \
  libz-dev \
  libssl-dev \
  asciidoc xmlto docbook2x install-info

# git-2.32.0.tar.xz  

FILE_NAME="git-${GIT_LATEST_VERSION}.tar.xz"
curl -sfLO https://www.kernel.org/pub/software/scm/git/${GIT_LATEST_VERSION} > /tmp/"${FILE_NAME}"

# https://git-scm.com/book/en/v2/Getting-Started-Installing-Git
cd /tmp
tar -zxf "${FILENAME}"
make configure
./configure --prefix=/usr
make all doc info
make install install-doc install-html install-info

