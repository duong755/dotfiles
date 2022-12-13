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
| `vim`        | Vim, tmux configuration                                                      |
| `os`         | OS-dependent scripts                                                         |

## Targets

This list does not document all targets. For the entire list, see `Makefile`.

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
make pathogen-all # install/update every plugins listed in this repo
make pathogen-basic # install/update some plugins listed in this repo
```

```bash
make font # install Ubuntu Nerd Font
```

</p>
</details>
