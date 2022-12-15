# My dotfiles repo

## Instructions

- Download or clone this repo.
- `cd` to the repo.
- Run `make [target name]`

## Directories

| Directory    | Content                                                                      |
|:-------------|:-----------------------------------------------------------------------------|
| `git`        | Installation script for git                                                  |
| `docker`     | Installation script for Docker Compose                                       |
| `node`       | Installation/Update script for Node, NVM; ESLint configuration collection    |
| `python`     | Installation script for pip, pipenv, pyenv                                   |
| `tex`        | Installation script, configuration files for TeX Live                        |
| `vim`        | Vim configuration                                                            |
| `neovim`     | Neovim installation script, configuration                                    |
| `os`         | OS-dependent scripts                                                         |

## Targets

This list does not document all targets. For the entire list, see `Makefile`.

<details><summary>TeX</summary>
<p>

```bash
make tex # install TeX Live (scheme: full)
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

<details><summary>Python</summary>
<p>

```bash
make python # install python, pip
```

</p>
</details>

<details><summary>Vim</summary>
<p>

```bash
make vim-all # install/update every plugins listed in this repo
make vim-basic # install/update some plugins listed in this repo
```

```bash
make font # install Ubuntu Nerd Font
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


## Post installation

<details><summary>Devtools</summary>
<p>

- [VSCode](https://code.visualstudio.com)
- [Postman](https://getpostman.com)
- [Docker](https://docs.docker.com/engine/install/debian/)
- AWS CLI
- Chromium Browser
- Tor Browser

</p>
</details>

<details><summary>Programming languages</summary>
<p>

- [go](https://go.dev/dl)
- [rust](https://rust-lang.org)

</p>
</details>

