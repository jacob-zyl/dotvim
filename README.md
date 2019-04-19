# The Project dotvim

Vim configuration files

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
