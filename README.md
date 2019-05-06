# The Project dotvim

Vim configuration files

## Thoughts

Here is a note for instant inspirations.

## Vim

The official Vim is obtained by
```
sudo apt install vim
```
The NeoVim is obtained by:
```
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim
sudo apt-get install python-dev python-pip python3-dev python3-pip
sudo apt-get install python3-neovim

sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
sudo update-alternatives --config vi
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --config vim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
sudo update-alternatives --config editor
```

## Initializatoin

Fetch the repository from github:

```
git clone git://github.com/Jacobi-Leo/dotvim.git ~/.vim
```

## Create Symbol Links

This step is very important.
```
ln -s ~/.vim/vimrc ~/.vimrc
```

## NeoVim Specification

```
mkdir ~/.config/nvim
touch ~/.config/nvim/init.vim
```
Add the following text to the new file:
```
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
```

## Manage Plugins 

To add a plug in:
```
git submodule add [URL] [local path]
```
To initialize the submodules:
```
git submodule init
git submodule update
```
To upgrade all submodules:
```
git submodule foreach git pull origin master
```
To remove a plugin:
```
# Remove the submodule entry from .git/config
git submodule deinit -f path/to/submodule

# Remove the submodule directory from the superproject's .git/modules directory
rm -rf .git/modules/path/to/submodule

# Remove the entry in .gitmodules and remove the submodule directory located at
# path/to/submodule
git rm -f path/to/submodule
```

### Plugin `deoplete`

This plugin and UltiSnips need vim to be compiled by python3. If `echo
has("python3")` returns `0` instead of `1`, one must run such command:
```
pip3 install --user pynvim
```
Special attention is required here with the option `--user`. Since this means
the `pynivm` is installed for the current user only, if `sudo -H` is prefixed,
then this will only be installed to the root user, instead of me.

This module is installed by install Ubuntu package `python3-neovim`. So this is
required only in non-Debian distros. However, `python3-neovim` is always too old
in most cases.
