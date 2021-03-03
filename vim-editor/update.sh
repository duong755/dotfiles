#!/bin/sh

update() {
  vim +PlugUpgrade
  vim +PlugUpdate
  vim +PlugClean
}

update
