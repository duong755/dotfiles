#!/bin/bash

# git-x.y.z.tar.gz
CURRENT_FILE_PATH=$(realpath "$0")
CURRENT_DIR_PATH=$(dirname "$CURRENT_FILE_PATH")

REPOSITORY_OF_GIT="https://www.kernel.org/pub/software/scm/git"

GIT_LOCAL_VERSION=$(git --version | grep -Po -m 1 "\d+\.\d+\.\d+")
GIT_LATEST_VERSION=$(curl -sL "$REPOSITORY_OF_GIT" | grep -Po "(?<=\")git-\d+\.\d+\.\d+\.tar\.gz" | xargs python3 "${CURRENT_DIR_PATH}"/git.py)

if [ -n "${GIT_LATEST_VERSION}" ]; then
  if [ "${GIT_LOCAL_VERSION}" != "${GIT_LATEST_VERSION}" ]; then
    echo "There is newer version of git: $GIT_LATEST_VERSION > $GIT_LOCAL_VERSION"
  else
    echo "git is already the latest version ($GIT_LOCAL_VERSION)"
  fi
else
  echo "Cannot get latest version of git"
fi
