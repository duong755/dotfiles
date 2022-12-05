SHELL=/bin/bash
CP=/bin/cp
MKDIR=/bin/mkdir
RM=/bin/rm
RMRF=/bin/rm -rf
LN=/bin/ln -sf

all:

.PHONY: update
update:
	@apt-get -y update

.PHONY: upgrade
upgrade:
	@apt-get -y upgrade
	@apt-get -y autoremove
	@apt-get -y autoclean

ubuntu-chore: update upgrade tlmgr-update

ubuntu-all:
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

kali-chore: update upgrade kali-git-version git-config

kali-git-version:
	@$(SHELL) ./os/kali/git-version.sh

kali-git:
	@$(SHELL) ./os/kali/git.sh

git-config:
	@$(SHELL) ./os/gitconfig.sh

.PHONY: node
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

cloud-aws:
	@$(SHELL) ./cloud/awscli.sh

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
