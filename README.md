# dotvim

vim configuration files

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

## Manage Plugins
To add a plug in:
```
git submodule add [URL]
```
To initialize and update the submodules:
```
git submodule init
git submodule update
```
