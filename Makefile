all:

basic:
	sh ./install.sh
node:
	sh ./node-install.sh
python:
	sh ./python-install.sh
vim:
	sh ./plug-install.sh vim all
neovim:
	sh ./plug-install.sh neovim all
vim-minimal:
	sh ./plug-install.sh vim minimal
neovim-minimal:
	sh ./plug-install.sh neovim minimal
vim-plain:
	sh ./plug-install.sh vim plain
neovim-plain:
	sh ./plug-install.sh neovim plain
