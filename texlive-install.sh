#!/usr/bin/env sh

wget -O ~/Downloads/install-tl-unx.tar.gz http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz

mkdir -p ~/Downloads/install-tl-latest
rm -rf ~/Downloads/install-tl-latest/install-tl-*
tar -xzf ~/Downloads/install-tl-unx.tar.gz -C ~/Downloads/install-tl-latest
cp ./installation.profile ~/Downloads/install-tl-latest/installation.profile

cd ~/Downloads/install-tl-latest/install-tl-*
chmod +x ./install-tl
sudo ./install-tl --scheme=scheme-full --profile=../installation.profile
