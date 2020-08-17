all:
	@$(MAKE) basic
	@$(MAKE) node
	@$(MAKE) python
	@$(MAKE) vim
	@$(MAKE) neovim
basic:
	@$(SHELL) ./install.sh
node:
	@$(SHELL) ./node-install.sh
python:
	@$(SHELL) ./python-install.sh
texlive:
	# more than 7GB
	# too large, so I excluded this from "all"
	@$(SHELL) ./tex/texlive-install.sh
vim:
	@$(SHELL) ./vim-editor/plug-install.sh vim all
neovim:
	@$(SHELL) ./vim-editor/plug-install.sh neovim all
vim-minimal:
	@$(SHELL) ./vim-editor/plug-install.sh vim minimal
neovim-minimal:
	@$(SHELL) ./vim-editor/plug-install.sh neovim minimal
vim-plain:
	@$(SHELL) ./vim-editor/plug-install.sh vim plain
neovim-plain:
	@$(SHELL) ./vim-editor/plug-install.sh neovim plain
