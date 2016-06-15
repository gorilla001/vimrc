# vimrc

```
mkdir -p ~/.vim/bundle/
```

```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

```
:PluginInstall
```
or

```
# vim +PluginInstall +qall
```
##Ubuntu
```
sudo apt-get install build-essential cmake
sudo apt-get install python-dev python3-dev
```
```
cd ~/.vim/bundle/YouCompleteMe
./install.py || ./install.py --all
```
```
vimrc: let g:ycm_python_binary_path = '/usr/bin/python3'
```

