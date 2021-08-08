SHELL=/bin/bash
CP=/bin/cp
MKDIR=/bin/mkdir

all:

ubuntu-chore:
	@$(MAKE) ubuntu-update
	@$(MAKE) ubuntu-upgrade
	@$(MAKE) tlmgr-update
	@$(MAKE) vim-update

ubuntu-all:
	# For the 1st time only
	@$(SHELL) ./os/ubuntu.sh

ubuntu-basic:
	@$(SHELL) ./os/ubuntu/basic.sh

ubuntu-k8s:
	@$(SHELL) ./os/ubuntu/k8s.sh

ubuntu-neovim:
	@$(SHELL) ./os/ubuntu/neovim.sh

ubuntu-python:
	@$(SHELL) ./os/ubuntu/python.sh

ubuntu-desktop:
	@$(SHELL) ./os/ubuntu/desktop.sh

ubuntu-update:
	@sudo apt-get -y update

ubuntu-upgrade:
	@sudo apt-get -y upgrade
	@sudo apt-get -y autoclean
	@sudo apt-get -y autoremove

kali-chore:
	@$(MAKE) kali-update
	@$(MAKE) kali-upgrade
	@$(MAKE) kali-git
	@$(MAKE) tlmgr-update
	@$(MAKE) vim-update

kali-update:
	@sudo apt-get -y update

kali-upgrade:
	@sudo apt-get -y upgrade
	@sudo apt-get -y autoclean
	@sudo apt-get -y autoremove

kali-git:
	@$(SHELL) ./os/kali/git.sh

.PHONY: node
node:
	@$(SHELL) ./node/install.sh

node-update:
	@$(SHELL) ./node/update.sh

python:
	@$(SHELL) ./python-install.sh

texlive:
	# more than 7GB
	# too large, so I excluded this from "all"
	@$(SHELL) ./tex/texlive-install.sh

tlmgr:
	@sudo env PATH="${PATH}" tlmgr update --list

tlmgr-update:
	@sudo env PATH="${PATH}" tlmgr update --self --all

cloud-aws:
	@$(SHELL) ./cloud/awscli.sh

.PHONY: vim
vim:
	@sudo $(SHELL) ./vim/font.sh
	@$(SHELL) ./vim/plug-install.sh vim all

vim-minimal:
	@$(SHELL) ./vim/plug-install.sh vim minimal

vim-plain:
	@$(SHELL) ./vim/plug-install.sh vim plain

neovim:
	@$(SHELL) ./vim/plug-install.sh neovim all

neovim-minimal:
	@$(SHELL) ./vim/plug-install.sh neovim minimal

neovim-plain:
	@$(SHELL) ./vim/plug-install.sh neovim plain

vim-update:
	@$(SHELL) ./vim/update.sh
