#!/usr/bin/env sh

CURRENT_FILE_PATH=$(realpath "$0")
CURRENT_DIRECTORY_PATH=$(dirname "$CURRENT_FILE_PATH")

sudo add-apt-repository -y ppa:git-core/ppa
sudo add-apt-repository -y ppa:neovim-ppa/unstable
sudo add-apt-repository -y ppa:deadsnakes/ppa
sudo add-apt-repository -y ppa:jonathonf/vim
sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test

sudo apt -y update
sudo apt -y upgrade

sudo apt install -y git
sudo apt install -y tree
sudo apt install -y xclip # copy to clipboard
sudo apt install -y python-pip
sudo apt install -y python3-pip
sudo apt install -y curl
sudo apt install -y tmux
sudo apt install -y neovim
sudo apt install -y vim
sudo apt install -y zsh

cp "${CURRENT_DIRECTORY_PATH}/default.tmux.conf" ~/.tmux.conf

sh "${CURRENT_DIRECTORY_PATH}/python-install.sh"
sh "${CURRENT_DIRECTORY_PATH}/node-install.sh"
sh "${CURRENT_DIRECTORY_PATH}/plug-install.sh"

echo "Installing zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
if [ ! -d "$ZSH/custom/plugins/zsh-autosuggestions" ]; then
  echo "Installing zsh-autosuggestions"
  git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH/custom/plugins/zsh-autosuggestions
fi
