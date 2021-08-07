#!/bin/bash

if [ $UID -ne "0" ]; then
  echo "Require root user"
  exit
fi

apt-get install -y \
  dh-autoreconf \
  libcurl4-gnutls-dev \
  libexpat1-dev \
  gettext \
  libz-dev \
  libssl-dev \
  asciidoc xmlto docbook2x install-info

# git-x.y.z.tar.gz
CURRENT_FILE_PATH=$(realpath "$0")
CURRENT_DIR_PATH=$(dirname "$CURRENT_FILE_PATH")

GIT_LOCAL_VERSION=$(git --version | grep -Po -m 1 "\d+\.\d+\.\d+")
GIT_LATEST_VERSION=$(curl -sL https://www.kernel.org/pub/software/scm/git/ | grep -Po "(?<=\")git-\d+\.\d+\.\d+\.tar\.gz" | xargs python3 "${CURRENT_DIR_PATH}"/git.py)
echo "$GIT_LATEST_VERSION"

if [ -n "${GIT_LATEST_VERSION}" ]; then
  if [ "${GIT_LOCAL_VERSION}" != "${GIT_LATEST_VERSION}" ]; then
    FILE_NAME="git-${GIT_LATEST_VERSION}.tar.gz"
    wget -O /tmp/"${FILE_NAME}" https://www.kernel.org/pub/software/scm/git/"${FILE_NAME}"

    chmod 0755 "/tmp/${FILE_NAME}"

    # https://git-scm.com/book/en/v2/Getting-Started-Installing-Git
    cd /tmp || exit
    tar -zxf "${FILE_NAME}"
    DIR_NAME="/tmp/git-${GIT_LATEST_VERSION}"
    cd "$DIR_NAME" || exit
    make configure
    ./configure --prefix=/usr
    make all doc info
    make install install-doc install-html install-info
  else
    echo "git is already the latest version"
  fi
else
  echo "Cannot get latest version of git"
fi

