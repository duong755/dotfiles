#!/bin/bash

git config --global core.editor vim
git config --global core.autocrlf input
git config --global core.eol lf
git config --global commit.sign true
git config --global merge.ff true
git config --global init.defaultbranch master
git config --global push.autosetupremote true
git config --global gpg.program gpg
