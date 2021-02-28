all:
	@$(MAKE) basic
	@$(MAKE) node
	@$(MAKE) python
	@$(MAKE) vim
	@$(MAKE) node-update
basic:
	@$(SHELL) ./install.sh
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
vim:
	@$(SHELL) ./vim-editor/plug-install.sh vim all
vim-minimal:
	@$(SHELL) ./vim-editor/plug-install.sh vim minimal
vim-plain:
	@$(SHELL) ./vim-editor/plug-install.sh vim plain
neovim:
	@$(SHELL) ./vim-editor/plug-install.sh neovim all
neovim-minimal:
	@$(SHELL) ./vim-editor/plug-install.sh neovim minimal
neovim-plain:
	@$(SHELL) ./vim-editor/plug-install.sh neovim plain
