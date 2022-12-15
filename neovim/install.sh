#!/bin/bash

if [ $UID != "0" ]; then
  echo "Require root user"
  exit
fi

function install() {
  case "$1" in
    nightly | unstable)
      curl -L https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage -o /usr/local/bin/nvim
      chmod a+x /usr/local/bin/nvim
      ;;
    stable)
      curl -L https://github.com/neovim/neovim/releases/download/stable/nvim.appimage -o /usr/local/bin/nvim
      chmod a+x /usr/local/bin/nvim
      ;;
    *)
      echo "'$1' is invalid. Please choose 'stable' or 'nightly' release."
      ;;
  esac
}

install $*
