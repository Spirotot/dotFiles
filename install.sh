#!/bin/bash

sudo eopkg it tmux gdb make cmake gcc g++ glibc-devel linux-headers python-devel golang rust cargo pip zsh diffutils llvm-clang atool docker

# Install/configure VIM & plugins...
mkdir -p ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
cd ~/.vim/bundle/YouCompleteMe && ./install.py --system-libclang --clang-completer --go-completer --rust-completer && cd -
vim +PluginInstall +qall

# Install GDB PEDA
git clone https://github.com/longld/peda.git ~/peda
echo "source ~/peda/peda.py" >> ~/.gdbinit
echo "DONE! debug your program with gdb and enjoy"

# Make sure ZSH is happy.
git clone https://github.com/zsh-users/antigen.git ~/antigen
sudo pip install tasklib
chsh -s $(which zsh)

# Make sure tmux is happy.
mkdir -p ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
