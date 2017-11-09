#!/bin/bash

sudo eopkg it tmux gdb make cmake gcc g++ glibc-devel linux-headers python-devel golang rust cargo

# Install/configure VIM & plugins...
mkdir -p ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
cd ~/.vim/bundle/YouCompleteMe && ./install.py --clang-completer --go-completer --rust-completer && cd -
vim +PluginInstall +qall

# Install GDB PEDA
git clone https://github.com/longld/peda.git ~/peda
echo "source ~/peda/peda.py" >> ~/.gdbinit
echo "DONE! debug your program with gdb and enjoy"

# Make sure ZSH is happy.
