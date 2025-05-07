#!/bin/bash

# $1: vim, nvim, neovim
# $2: all, full, basic

# https://github.com/tpope/vim-pathogen/blob/master/README.markdown
mkdir -p ~/.vim/autoload ~/.vim/bundle
mkdir -p ~/.config/nvim/autoload ~/.config/nvim/bundle
curl -sLSo ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
cp ~/.vim/autoload/pathogen.vim ~/.config/nvim/autoload/pathogen.vim

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
full_repos+=('tpope/vim-surround')
full_repos+=('airblade/vim-gitgutter')
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
full_repos+=('neoclide/jsonc.vim')
full_repos+=('sbdchd/neoformat')
full_repos+=('vim-test/vim-test')
# full_repos+=('prettier/vim-prettier')
# full_repos+=('pangloss/vim-javascript')
# full_repos+=('leafgarland/typescript-vim')
# full_repos+=('peitalin/vim-jsx-typescript')
# full_repos+=('tpope/vim-fireplace')
# full_repos+=('rust-lang/rust.vim')

basic_repos=()
basic_repos+=('joshdick/onedark.vim')
basic_repos+=('editorconfig/editorconfig-vim')
basic_repos+=('sheerun/vim-polyglot')
basic_repos+=('christoomey/vim-tmux-navigator')
basic_repos+=('tpope/vim-fugitive')
basic_repos+=('tpope/vim-surround')
basic_repos+=('airblade/vim-gitgutter')
basic_repos+=('preservim/nerdtree')
basic_repos+=('Xuyuanp/nerdtree-git-plugin')
basic_repos+=('jistr/vim-nerdtree-tabs')
basic_repos+=('preservim/nerdcommenter')
basic_repos+=('vim-airline/vim-airline')
basic_repos+=('vim-airline/vim-airline-themes')

### install
function clone_or_pull() {
  # param $1: editor. Examples: vim, nvim, neovim
  # param $2: github repository. Examples: tpope/vim-fugitive, editorconfig/editorconfig-vim
  local editor
  local repo
  editor="$1"
  repo="$2"

  PATHOGEN_LOCATION=""
  case "$editor" in
    vim)
      PATHOGEN_LOCATION=~/.vim/bundle
      ;;
    nvim | neovim)
      PATHOGEN_LOCATION=~/.config/nvim/bundle
      ;;
    *)
      exit
      ;;
  esac

  local onlyrepo
  local plugin
  local branch

  onlyrepo=$(echo "$repo" | grep --perl-regexp --only-matching "^[^\?](.+(?=\?)|.+$)")

  plugin=$(echo "$repo" | grep --perl-regexp --only-matching "(?<=\/)(.+(?=\?)|.+$)")
  branch=$(echo "$repo" | grep --perl-regexp --only-matching "(?<=\?branch=)(.+(?=&)|.+$)")

  if [ -n "$plugin" ]; then
    if [ -d "$PATHOGEN_LOCATION/$plugin" ]; then
      echo "Updating $plugin..."
      /usr/bin/git -C "$PATHOGEN_LOCATION/$plugin" pull --no-edit
      echo ""
    else
      echo "Installing $plugin..."
      if [ ! -n "$branch" ]; then
        /usr/bin/git -C "$PATHOGEN_LOCATION" clone --depth 1 "https://github.com/$onlyrepo"
      else
        /usr/bin/git -C "$PATHOGEN_LOCATION" clone --depth 1 "https://github.com/$onlyrepo" -b "$branch"
      fi
      echo ""
    fi
  else
    echo "Cannot extract plugin's name"
  fi
}

function install_and_update_plugins() {
  # param $1: editor. Examples: vim, nvim, neovim
  # param $2: pack of github repositories. Supported values: all, full, basic
  local repos
  repos=()

  # never assign array to variable in shell script
  # append element by element instead
  case "$2" in
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
      echo "No plugins will be installed. Choose 'full', 'all', or 'basic'"
      exit
      ;;
  esac

  for repo in "${repos[@]}"; do
    clone_or_pull "$1" "$repo"
  done
}

install_and_update_plugins "$@"
