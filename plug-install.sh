#!/usr/bin/env sh

mkdir -p ~/.ctags.d
cp ./defaults.ctags ~/.ctags.d/default.ctags

mkdir -p ~/.vim/plugged

# for vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp init.vim ~/.vimrc
source ~/.vimrc

# for neovim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir -p ~/.config/nvim
cp init.vim ~/.config/nvim/init.vim

vim +PlugInstall +qall
vim +CocInstall coc-json coc-emmet coc-highlight coc-pairs coc-snippets coc-html coc-css coc-git coc-eslint coc-tsserver coc-rls coc-angular coc-python coc-ccls +qall
