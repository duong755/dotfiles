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

kali-chore: update upgrade kali-git

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
	@tlmgr update --list

tlmgr-update:
	@$(SHELL) ./tex/tlmgr-update.sh

cloud-aws:
	@$(SHELL) ./cloud/awscli.sh

font:
	@$(SHELL) ./vim/font.sh

### vim-plug

plug-all:
	@$(SHELL) ./vim/vim-plug/plug-install.sh vim all
	@$(SHELL) ./vim/vim-plug/plug-install.sh neovim all

plug-minimal:
	@$(SHELL) ./vim/vim-plug/plug-install.sh vim minimal
	@$(SHELL) ./vim/vim-plug/plug-install.sh neovim minimal

plug-plain:
	@$(SHELL) ./vim/vim-plug/plug-install.sh vim plain
	@$(SHELL) ./vim/vim-plug/plug-install.sh neovim plain

plug-update:
	@$(SHELL) ./vim/vim-plug/update.sh

### vim-pathogen

link-neovim-to-vim:
	@$(RMRF) ~/.config/nvim
	@$(LN) ~/.vim ~/.config/nvim
	@$(LN) ~/.vimrc ~/.config/nvim/init.vim
	@$(CP) ./vim/.tmux.conf ~/.tmux.conf
	@$(CP) ./vim/coc-settings.json ~/.config/nvim
	@$(MAKE) node-update

pathogen-all:
	@$(SHELL) ./vim/pathogen/pathogen.sh all
	@$(CP) ./vim/pathogen/vimrc ~/.vimrc
	@$(MAKE) link-neovim-to-vim

pathogen-basic:
	@$(SHELL) ./vim/pathogen/pathogen.sh basic
	@$(CP) ./vim/pathogen/vimrc ~/.vimrc
	@$(MAKE) link-neovim-to-vim

### vim pack

pack-all:
	@$(SHELL) ./vim/pack/plugin.sh all
	@$(CP) ./vim/pack/vimrc ~/.vimrc
	@$(MAKE) link-neovim-to-vim

pack-basic:
	@$(SHELL) ./vim/pack/plugin.sh basic
	@$(CP) ./vim/pack/vimrc ~/.vimrc
	@$(MAKE) link-neovim-to-vim

go-latest:
	@$(SHELL) ./go/version.sh
