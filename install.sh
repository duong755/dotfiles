#!/usr/bin/env sh

add-apt-repository ppa:git-core/ppa
add-apt-repository ppa:neovim-ppa/unstable
add-apt-repository ppa:deadsnakes/ppa
add-apt-repository ppa:jonathonf/vim
add-apt-repository ppa:ubuntu-toolchain-r/test

apt update
apt upgrade

apt install git
apt install tree
apt install xclip
apt install curl
apt install neovim
apt install vim

apt install openjdk-8-jdk openjdk-8-jre

