#!/bin/sh

update() {
  vim +PlugUpgrade +qall
  vim +PlugUpdate +qall
  vim +PlugClean +qall
}

update
