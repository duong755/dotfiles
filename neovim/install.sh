#!/bin/bash

if [ $UID != "0" ]; then
  echo "Require root user"
  exit
fi

NIGHTLY_RELEASE_DOWNLOAD_URL=https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
STABLE_RELEASE_DOWNLOAD_URL=https://github.com/neovim/neovim/releases/download/stable/nvim.appimage

NEOVIM_EXECUTABLE=/usr/bin/nvim

function install() {
  case "$1" in
    nightly | unstable)
      curl -L "$NIGHTLY_RELEASE_DOWNLOAD_URL" -o "$NEOVIM_EXECUTABLE"
      chmod a+x "$NEOVIM_EXECUTABLE"
      ;;
    stable)
      curl -L "$STABLE_RELEASE_DOWNLOAD_URL" -o "$NEOVIM_EXECUTABLE"
      chmod a+x "$NEOVIM_EXECUTABLE"
      ;;
    *)
      echo "'$1' is invalid. Please choose 'stable' or 'nightly' release."
      ;;
  esac
}

install "$@"
