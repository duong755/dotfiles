#!/bin/bash

if [ $UID -ne "0" ]; then
  echo "Require root user"
  exit
fi

CURRENT_FILE_PATH=$(realpath "$0")
CURRENT_DIRECTORY_PATH=$(dirname "$CURRENT_FILE_PATH")

echo "Copying asymptote config..."
if [ ! -d ~/.asy ]; then
  mkdir -p ~/.asy
fi
cp "${CURRENT_DIRECTORY_PATH}/asyconfig.asy" ~/.asy/config.asy

echo "Copying latexmkrc..."
cp "${CURRENT_DIRECTORY_PATH}/latexmkrc" ~/.latexmkrc

echo "Downloading texlive installer..."
wget -O /tmp/install-tl-unx.tar.gz http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz

mkdir -p /tmp/install-tl-latest
rm -rf /tmp/install-tl-latest/install-tl-* # remove stale files
tar -xzf /tmp/install-tl-unx.tar.gz -C /tmp/install-tl-latest
cp ./tex/installation.profile /tmp/install-tl-latest/installation.profile

echo "Installing texlive-full..."
cd /tmp/install-tl-latest/install-tl-* || exit 1
chmod +x ./install-tl
./install-tl --scheme=scheme-full --profile=../installation.profile

echo "Installing cpan modules for latexindent.pl"
cpan install Log::Log4perl YAML::Tiny File::HomeDir
