#!/usr/bin/bash

update-vim() {
  vim +PlugUpgrade +qall
  vim +PlugUpdate +qall
  vim +PlugClean +qall
  vim +CocUpdate +qall
}

update-neovim() {
  nvim +PlugUpgrade +qall
  nvim +PlugUpdate +qall
  nvim +PlugClean +qall
  nvim +CocUpdate +qall
}

update-vim
update-neovim
