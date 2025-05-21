# My dotfiles repo

## Instructions

- Download or clone this repo.
- `cd` to the repo.
- Run `make [target name]`

## Directories

| Directory          | Content                                               |
|:-------------------|:------------------------------------------------------|
| `git`              | Installation script for git                           |
| `docker`           | Installation script for Docker Compose                |
| `node`             | Installation/Update script for Node, NVM              |
| `tex`              | Installation script, configuration files for TeX Live |
| `vim`              | Vim configuration                                     |
| `neovim`           | Neovim installation script, configuration             |
| `package-managers` | Linux-package-manager-dependent scripts               |

## Targets

This list does not document all targets. For the entire list, see `Makefile`.

<details><summary>TeX</summary>
<p>

```bash
make texlive # install TeX Live (scheme: full)
```

</p>
</details>

<details><summary>Node</summary>
<p>

```bash
make node # install node with nvm (lts version)
make node-update # install latest version of node, update g:coc_node_path in ~/.vimrc
```

</p>
</details>

<details><summary>Vim</summary>
<p>

```bash
make vim-all # install/update all plugins listed in this repo
make vim-basic # install/update some plugins listed in this repo
```

</p>
</details>

<details><summary>Neovim</summary>
<p>

```bash
make neovim-stable # install latest stable release of Neovim
make neovim-nightly # install latest nightly release of Neovim

make neovim-all # install/update vim-plug and Neovim plugins
```

</p>
</details>

