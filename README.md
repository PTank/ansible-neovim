# Neovim Ansible

Install `neovim` and configure it with co-configuration with `vim`.

## Vim

Make a single config for vim + nvim.

## Var

| Variables                       | Usage | Default |
|:-------------------------------:|:-----:|:---------------------------------------------:|
| `nvim_installation`             | apt/appimage/source | apt |
| `nvim_source_dest`              |       | /tmp |
| `nvim_source_version`           |       | master |
| `nvim_source_build_mode`        |       | Release |
| `have_root		 `        |       | Extra var for source installation if set to false skip deps |
| `nvim_autoload_dir`             |       | /home/$USER/.local/share/nvim/site/autoload |
| `vim_autoload_dir`              |       | /home/$USER/.vim/autoload |
| `nvim_conf_dir`                 |       | /home/$USER/.config/nvim |
| `nvim_conf`                     |       | /home/$USER/.config/nvim/init.vim |
| `vim_conf`                      |       | /home/$USER/.virmc |
| `nvim_plugins` | List of vim plugins, accept mapping entry with options for vim plug | [] |
| `exclusive_nvim_plugins`        |       | []                 |
| `exclusive_vim_plugins`         |       | []                 |
| `nvim_configuration`            | Vim config script | "" |
| `exclusive_nvim_configuration`  |       | ""                 |
| `exclusive_vim_configuration `  |       | ""                 |

## Usage

Add the project to your galaxy requirement

```yaml
- name: "ansible-neovim"
  src: "https://github.com/PTank/ansible-neovim.git"
  version: "master"
```

Playbook:

```yaml
-name: Install Nvim
 host: localhost
 connection: local
 tasks:
   - import_role:
     name: ansible-neovim
     vars:
       nvim_configuration: |
         set number
         set t_Co=256
       nvim_plugins:
         - name: junegunn/fzf
           options:
             do: '-> fzf#install()'
         - junegunn/fzf.vim
         - vim-airline/vim-airline
         - vim-airline/vim-airline-themes
```

If you want to add a pre-clean or just clean this installation:

```yaml
- import_role:
    name: ansible-neovim
    tasks_from: clean_config
```
