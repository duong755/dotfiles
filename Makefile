SHELL=/bin/bash
CP=/bin/cp
MKDIR=/bin/mkdir
RM=/bin/rm
RMRF=/bin/rm -rf
LN=/bin/ln -sf

all:

update:
	@apt-get -y update

upgrade:
	@apt-get -y upgrade
	@apt-get -y autoremove
	@apt-get -y autoclean

ubuntu-chore: update upgrade tlmgr-update

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

kali-chore: update upgrade git-version git-config

debian-init:
	@$(SHELL) ./os/debian.sh
	@$(MAKE) git-update

debian-chore: update upgrade git-version git-config

git-version:
	@$(SHELL) ./git/git-version.sh

git-update:
	@$(SHELL) ./git/git.sh

git-config:
	@$(SHELL) ./git/git-config.sh

.PHONY: node
node:
	@$(SHELL) ./node/install.sh

node-update:
	@$(SHELL) ./node/update.sh

.PHONY: python
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

### vim-pathogen

vimconf:
	@$(RMRF) ~/.config/nvim
	@$(CP) ./vim/pathogen/vimrc ~/.vimrc
	@$(CP) ./vim/tmux.conf ~/.tmux.conf
	@$(LN) ~/.vim ~/.config/nvim
	@$(LN) ~/.vimrc ~/.config/nvim/init.vim

pathogen-all:
	@$(SHELL) ./vim/pathogen/pathogen.sh all
	@$(CP) ./vim/pathogen/vimrc ~/.vimrc
	@$(MAKE) vimconf

pathogen-basic:
	@$(SHELL) ./vim/pathogen/pathogen.sh basic
	@$(CP) ./vim/pathogen/vimrc ~/.vimrc
	@$(MAKE) vimconf
