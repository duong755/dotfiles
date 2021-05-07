#!/usr/bin/bash

update-vim() {
  vim +PlugUpgrade +qall
  vim +PlugUpdate +qall
  vim +PlugClean +qall
}

update-neovim() {
  nvim +PlugUpgrade +qall
  nvim +PlugUpdate +qall
  nvim +PlugClean +qall
}

update-vim
update-neovim
vim +CocUpdate
