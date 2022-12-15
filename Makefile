SHELL=/bin/bash
CP=/bin/cp
MKDIR=/bin/mkdir
RM=/bin/rm -f
RMRF=/bin/rm -rf
LN=/bin/ln -sf
NEOVIM=/usr/bin/nvim

all:

common:
	@$(CP) ./wgetrc ~/.wgetrc
	@$(CP) ./vim/pathogen/vimrc ~/.vimrc
	@$(CP) ./neovim/init.lua ~/.config/nvim/init.lua
	@$(CP) ./tmux.conf ~/.tmux.conf

apt-update:
	@apt-get -y update

apt-upgrade:
	@apt-get -y upgrade
	@apt-get -y autoremove
	@apt-get -y autoclean

dnf-upgrade:
	@dnf -y upgrade
	@dnf -y autoremove
	@dnf clean all

debian-init:
	@$(SHELL) ./os/debian.sh
	@$(MAKE) git-update

debian-chore: apt-update apt-upgrade git-version

fedora-init:
	@$(SHELL) ./os/fedora.sh
	@$(MAKE) git-update

fedora-chore: dnf-upgrade git-version

git-version:
	@$(SHELL) ./git/git-version.sh

git-update:
	@$(SHELL) ./git/git.sh
	@$(MAKE) git-config

git-config:
	@$(SHELL) ./git/git-config.sh

node:
	@$(SHELL) ./node/install.sh

node-update:
	@$(SHELL) ./node/update.sh

python:
	@$(SHELL) ./python/python-install.sh
	@$(SHELL) ./python/env.sh

docker-compose-latest:
	@$(SHELL) ./docker/docker-compose.sh latest

docker-compose-all:
	@$(SHELL) ./docker/docker-compose.sh all

texlive:
	# More than 7GB
	@$(SHELL) ./tex/texlive-install.sh

tlmgr:
	# Won't work even with `sudo`. Run `sudo su` then this command
	@tlmgr update --list

tlmgr-update:
	# Won't work even with `sudo`. Run `sudo su` then this command
	@$(SHELL) ./tex/tlmgr-update.sh

font:
	@$(SHELL) ./vim/font.sh

### vim and neovim

vim-all: common
	@$(SHELL) ./vim/pathogen/pathogen.sh vim all
	@$(CP) ./vim/pathogen/vimrc ~/.vimrc

vim-basic: common
	@$(SHELL) ./vim/pathogen/pathogen.sh vim basic
	@$(CP) ./vim/pathogen/vimrc ~/.vimrc

neovim-stable:
	@$(SHELL) ./neovim/install.sh stable

neovim-nightly:
	@$(SHELL) ./neovim/install.sh nightly

neovim-all: common
	@$(SHELL) ./neovim/vim-plug.sh
	@$(NEOVIM) +PlugUpdate +qall

.PHONY: python node
