SHELL=/bin/bash
CP=/bin/cp
MKDIR=/bin/mkdir

all:
	@$(MAKE) node
	@$(MAKE) python
	@$(MAKE) vim
	@$(MAKE) node-update

ubuntu-chore:
	@$(MAKE) ubuntu-update
	@$(MAKE) ubuntu-upgrade
	@$(MAKE) tlmgr-update
	@$(MAKE) vim-update

ubuntu-all:
	@$(SHELL) ./pkgman/ubuntu.sh

ubuntu-basic:
	@$(SHELL) ./pkgman/ubuntu/basic.sh

ubuntu-k8s:
	@$(SHELL) ./pkgman/ubuntu/k8s.sh

ubuntu-neovim:
	@$(SHELL) ./pkgman/ubuntu/neovim.sh

ubuntu-python:
	@$(SHELL) ./pkgman/ubuntu/python.sh

ubuntu-desktop:
	@$(SHELL) ./pkgman/ubuntu/desktop.sh

ubuntu-update:
	@sudo apt-get -y update

ubuntu-upgrade:
	@sudo apt-get -y upgrade
	@sudo apt-get -y autoclean
	@sudo apt-get -y autoremove

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
