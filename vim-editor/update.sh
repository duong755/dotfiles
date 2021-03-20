#!/usr/bin/bash

update-vim() {
  vim +PlugUpgrade +qall
  vim +PlugUpdate +qall
  vim +PlugClean +qall
  vim +CocUpdate
}

update-neovim() {
  nvim +PlugUpgrade +qall
  nvim +PlugUpdate +qall
  nvim +PlugClean +qall
  nvim +CocUpdate
}

update-vim
update-neovim
