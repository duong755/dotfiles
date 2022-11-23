# My dotfiles repo

## Instructions

- Download or clone this repo.
- `cd` to the repo.
- Run `make [target name]`

## Targets

This list does not document every targets.

### Node

```bash
make node # install node with nvm (lts version)
make node-update # install latest version of node, update g:coc_node_path in ~/.vimrc
```

### Python

```bash
make python # install python, pip
```

### TeX Live

```bash
make texlive # install TeX Live (scheme-full, >7GB)
```

### Vim

For vim-pathogen users

```bash
make pathogen-all # install/update every plugins listed in this repo
make pathogen-basic # install/update some plugins listed in this repo
```

For vim pack users

```bash
make pack-all # install/update every plugins listed in this repo
make pack-basic # install/update some plugins listed in this repo
```

Install font (for NERDTree)

```bash
make font
```
