SHELL=/bin/bash
CP=/bin/cp
MKDIR=/bin/mkdir
RM=/bin/rm -f
RMRF=/bin/rm -rf
LN=/bin/ln -sf
NEOVIM=nvim

all:

common:
	@$(CP) ./wgetrc ~/.wgetrc
	@$(MKDIR) -p ~/.config/nvim
	@$(CP) ./vim/pathogen/vimrc ~/.vimrc
	@$(CP) ./neovim/init.lua ~/.config/nvim/init.lua
	@$(CP) ./tmux.conf ~/.tmux.conf

apt-update:
	@apt-get -y update

apt-upgrade:
	@apt-get -y upgrade
	@apt-get -y autoremove
	@apt-get -y autoclean

debian-init:
	@$(SHELL) ./package-managers/debian.sh

debian-chore: apt-update apt-upgrade git-version vim-all neovim-all

git-version:
	@$(SHELL) ./git/git-version.sh

git-update:
	@$(SHELL) ./git/git.sh
	@$(MAKE) git-config

git-config:
	@$(SHELL) ./git/git-config.sh

nvm:
	@$(SHELL) ./node/install.sh

node-update:
	@$(SHELL) ./node/update.sh

texlive:
	# More than 7GB
	@$(SHELL) ./tex/texlive-install.sh

tlmgr:
	# Won't work even with `sudo`. Run `sudo su` then this command
	@tlmgr update --list

tlmgr-update:
	# Won't work even with `sudo`. Run `sudo su` then this command
	@$(SHELL) ./tex/tlmgr-update.sh

### vim and neovim

vim-all: common
	@$(SHELL) ./vim/pathogen/pathogen.sh vim all

vim-basic: common
	@$(SHELL) ./vim/pathogen/pathogen.sh vim basic

neovim-all: common
	@$(SHELL) ./neovim/vim-plug.sh
	@$(NEOVIM) +PlugUpdate +qall

