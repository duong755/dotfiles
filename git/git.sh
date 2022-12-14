#!/bin/bash

if [ $UID -ne "0" ]; then
  echo "Require root user"
  exit
fi

function install_git_dependencies() {
  apt-get install -y \
    dh-autoreconf \
    libcurl4-gnutls-dev \
    libexpat1-dev \
    gettext \
    libz-dev \
    libssl-dev \
    asciidoc xmlto docbook2x install-info
}

# git-x.y.z.tar.gz
CURRENT_FILE_PATH=$(realpath "$0")
CURRENT_DIR_PATH=$(dirname "$CURRENT_FILE_PATH")

REPOSITORY_OF_GIT="https://www.kernel.org/pub/software/scm/git"

GIT_LOCAL_VERSION=$(if command -v git &> /dev/null; then `git --version | grep -Po -m 1 "\d+\.\d+\.\d+"`; else echo ""; fi)
GIT_LATEST_VERSION=$(curl -sL "$REPOSITORY_OF_GIT" | grep -Po "(?<=\")git-\d+\.\d+\.\d+\.tar\.gz" | xargs python3 "${CURRENT_DIR_PATH}"/git.py)

if [ -n "${GIT_LATEST_VERSION}" ]; then
  if [ "${GIT_LOCAL_VERSION}" != "${GIT_LATEST_VERSION}" ]; then
    FILE_NAME="git-${GIT_LATEST_VERSION}.tar.gz"
    wget -O /tmp/"$FILE_NAME" "$REPOSITORY_OF_GIT/$FILE_NAME"

    chmod 0755 "/tmp/${FILE_NAME}"

    echo "Installing git's dependencies..."
    install_git_dependencies

    # https://git-scm.com/book/en/v2/Getting-Started-Installing-Git
    cd /tmp || exit
    tar -zxf "${FILE_NAME}"
    DIR_NAME="/tmp/git-${GIT_LATEST_VERSION}"
    cd "$DIR_NAME" || exit
    echo "Installing git..."
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

