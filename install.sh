#!/bin/bash

sudo eopkg it tmux gdb make cmake gcc g++ glibc-devel linux-headers python-devel golang rust cargo pip zsh diffutils llvm-clang atool docker taskwarrior pkg-config dbus-devel dbus-glib-devel strace vagrant python-ipython pandoc pandoc-citeproc texlive-all bibtool virtualenv sshfs-fuse git-lfs

# Make Docker happy
sudo usermod -a -G docker $USER

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

# Install timewarrior
sudo snap install timew-spirotot
sudo snap alias timew-spirotot.timew timew

# Set up taskwarrior
mkdir -p ~/.task/hooks
#ln -s /snap/timew-spirotot/current/share/doc/timew/ext/on-modify.timewarrior ~/.task/hooks/on-modify.timewarrior
cp /snap/timew-spirotot/current/share/doc/timew/ext/on-modify.timewarrior ~/.task/hooks/
chmod +x ~/.task/hooks/on-modify.timewarrior


# And Bugwarrior..
sudo pip install bugwarrior
sudo pip install "bugwarrior[keyring]"
cd ~/.config/systemd/user && systemctl --user enable bugwarrior-pull.timer && systemctl --user start bugwarrior-pull.timer && cd -

# And tasksh.
cd ~/bin && wget https://raw.githubusercontent.com/chihchun/snapcraft-docker/a8d3161a61cb921e1f895742209e66f73c6579e6/snapcraft-docker && chmod +x snapcraft-docker && cd -
cd /tmp
git clone https://github.com/Spirotot/tasksh-spirotot.git && cd tasksh-spirotot && snapcraft-docker ./build.sh && sudo snap install --dangerous --classic ./*.snap && cd ~/

sudo snap alias tasksh-spirotot.tasksh tasksh
sudo snap alias timew-spirotot.timew timew
