all:
	$(MAKE) basic
	$(MAKE) node
	$(MAKE) python
	$(MAKE) vim
	$(MAKE) neovim
basic:
	sh ./install.sh
node:
	sh ./node-install.sh
python:
	sh ./python-install.sh
texlive:
	# more than 7GB
	# too large, so I excluded this from "all"
	sh ./tex/texlive-install.sh
vim:
	sh ./vim-editor/plug-install.sh vim all
neovim:
	sh ./vim-editor/plug-install.sh neovim all
vim-minimal:
	sh ./vim-editor/plug-install.sh vim minimal
neovim-minimal:
	sh ./vim-editor/plug-install.sh neovim minimal
vim-plain:
	sh ./vim-editor/plug-install.sh vim plain
neovim-plain:
	sh ./vim-editor/plug-install.sh neovim plain
