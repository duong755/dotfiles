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

apt-update:
	@apt-get -y update

apt-upgrade:
	@apt-get -y upgrade
	@apt-get -y autoremove
	@apt-get -y autoclean

ubuntu-chore: apt-update apt-upgrade

ubuntu-init:
	# For the 1st time only
	@$(SHELL) ./os/ubuntu.sh

ubuntu-basic:
	@$(SHELL) ./os/ubuntu/basic.sh

ubuntu-neovim:
	@$(SHELL) ./os/ubuntu/neovim.sh

ubuntu-python:
	@$(SHELL) ./os/ubuntu/python.sh

ubuntu-desktop:
	@$(SHELL) ./os/ubuntu/desktop.sh

kali-init:
	@$(SHELL) ./os/kali.sh
	@$(MAKE) git-update

kali-chore: apt-update apt-upgrade git-version git-config

debian-init:
	@$(SHELL) ./os/debian.sh
	@$(MAKE) git-update

debian-chore: apt-update apt-upgrade git-version git-config

git-version:
	@$(SHELL) ./git/git-version.sh

git-update:
	@$(SHELL) ./git/git.sh

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
	# more than 7GB
	# too large, so I excluded this from "all"
	@$(SHELL) ./tex/texlive-install.sh

tlmgr:
	@tlmgr update --list

tlmgr-update:
	@$(SHELL) ./tex/tlmgr-update.sh

font:
	@$(SHELL) ./vim/font.sh

### vim and neovim

__editor__:
	@$(CP) ./vim/pathogen/vimrc ~/.vimrc
	@$(CP) ./neovim/init.lua ~/.config/nvim/init.lua
	@$(CP) ./tmux.conf ~/.tmux.conf

vim-all: __editor__
	@$(SHELL) ./vim/pathogen/pathogen.sh vim all
	@$(CP) ./vim/pathogen/vimrc ~/.vimrc

vim-basic: __editor__
	@$(SHELL) ./vim/pathogen/pathogen.sh vim basic
	@$(CP) ./vim/pathogen/vimrc ~/.vimrc

neovim-stable:
	@$(SHELL) ./neovim/install.sh stable

neovim-nightly:
	@$(SHELL) ./neovim/install.sh nightly

neovim-all: __editor__
	@$(SHELL) ./neovim/vim-plug.sh
	@$(NEOVIM) +PlugUpdate +qall

.PHONY: python node
