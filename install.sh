#!/bin/sh

CURRENT_FILE_PATH=$(realpath "$0")
CURRENT_DIRECTORY_PATH=$(dirname "$CURRENT_FILE_PATH")

sudo add-apt-repository -y ppa:git-core/ppa
sudo add-apt-repository -y ppa:jonathonf/vim

sudo apt -y update
sudo apt -y upgrade

sudo apt install -y \
  git \
  tree \
  xclip \
  python3-pip \
  python-apt \
  curl \
  apt-transport-https \
  gnupg-agent \
  jq \
  tmux \
  vim \
  fonts-powerline \
  cpanminus \
  freeglut3 \
  deja-dup \
  openjdk-8-jre-headless \
  openjdk-8-jdk-headless

# for latexindent.pl
sudo cpan install Log::Log4perl YAML::Tiny File::HomeDir

cp "${CURRENT_DIRECTORY_PATH}/default.tmux.conf" ~/.tmux.conf
