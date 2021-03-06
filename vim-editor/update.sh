#!/usr/bin/bash

update() {
  vim +PlugUpgrade +qall
  vim +PlugUpdate +qall
  vim +PlugClean +qall
}

update
