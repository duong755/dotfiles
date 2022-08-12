#!/bin/bash

# https://github.com/tpope/vim-pathogen/blob/master/README.markdown
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -sLSo ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

### list of plugins
###
### syntax:
### owner/repo
### owner/repo?branch=branch_name
###
full_repos=()
full_repos+=('joshdick/onedark.vim')
full_repos+=('editorconfig/editorconfig-vim')
full_repos+=('sheerun/vim-polyglot')
full_repos+=('christoomey/vim-tmux-navigator')
full_repos+=('tpope/vim-fugitive')
full_repos+=('preservim/nerdtree')
full_repos+=('Xuyuanp/nerdtree-git-plugin')
full_repos+=('jistr/vim-nerdtree-tabs')
full_repos+=('easymotion/vim-easymotion')
full_repos+=('preservim/nerdcommenter')
full_repos+=('vim-airline/vim-airline')
full_repos+=('vim-airline/vim-airline-themes')
full_repos+=('ryanoasis/vim-devicons')
full_repos+=('dense-analysis/ale')
full_repos+=('Shougo/neco-vim')
# full_repos+=('neoclide/coc-neco')
# full_repos+=('neoclide/coc.nvim?branch=release')
full_repos+=('neoclide/jsonc.vim')
full_repos+=('sbdchd/neoformat')
full_repos+=('prettier/vim-prettier')
full_repos+=('pangloss/vim-javascript')
full_repos+=('leafgarland/typescript-vim')
full_repos+=('peitalin/vim-jsx-typescript')

basic_repos=()
basic_repos+=('joshdick/onedark.vim')
basic_repos+=('sheerun/vim-polyglot')
basic_repos+=('christoomey/vim-tmux-navigator')
basic_repos+=('tpope/vim-fugitive')
basic_repos+=('preservim/nerdtree')
basic_repos+=('Xuyuanp/nerdtree-git-plugin')
basic_repos+=('jistr/vim-nerdtree-tabs')
basic_repos+=('preservim/nerdcommenter')
basic_repos+=('vim-airline/vim-airline')
basic_repos+=('vim-airline/vim-airline-themes')
# basic_repos+=('neoclide/coc.nvim?branch=release')

### install

pathogen_location=~/.vim/bundle
cd $pathogen_location || exit

function clone_or_pull() {
  local repo
  repo="$1"

  local onlyrepo
  local plugin
  local branch

  onlyrepo=$(echo "$repo" | grep --perl-regexp --only-matching "^[^\?](.+(?=\?)|.+$)")

  plugin=$(echo "$repo" | grep --perl-regexp --only-matching "(?<=\/)(.+(?=\?)|.+$)")
  branch=$(echo "$repo" | grep --perl-regexp --only-matching "(?<=\?branch=)(.+(?=&)|.+$)")

  if [ -n "$plugin" ]; then
    if [ -d "$pathogen_location/$plugin" ]; then
      echo "Updating $plugin..."
      /usr/bin/git -C "$pathogen_location/$plugin" pull --no-edit
      echo ""
    else
      echo "Installing $plugin..."
      if [ ! -n "$branch" ]; then
        /usr/bin/git -C "$pathogen_location" clone --depth 1 "https://github.com/$onlyrepo"
      else
        /usr/bin/git -C "$pathogen_location" clone --depth 1 "https://github.com/$onlyrepo" -b "$branch"
      fi
      echo ""
    fi
  else
    echo "Cannot extract plugin's name"
  fi
}

function install_and_update_plugins() {
  local repos
  repos=()

  # never assign array to variable in shell script
  # append element by element instead
  case "$1" in
    full | all)
      if ! command -v ccls &> /dev/null; then
        echo "============================"
        echo "REMEMBER TO INSTALL ccls    "
        echo "IF YOU WANT TO CODE IN C/C++"
        echo "============================"
      fi

      for elem in "${full_repos[@]}"; do
        repos+=("$elem")
      done
      ;;
    basic)
      for elem in "${basic_repos[@]}"; do
        repos+=("$elem")
      done
      ;;
    *)
      echo "No plugins are installed"
      exit
      ;;
  esac

  for repo in "${repos[@]}"; do
    clone_or_pull "$repo"
  done
}

# $1 should be "full", "all", "basic" or empty
install_and_update_plugins "$1"
