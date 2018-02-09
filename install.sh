#!/bin/bash

#sudo eopkg it tmux gdb make cmake gcc g++ glibc-devel linux-headers python-devel golang rust cargo pip zsh diffutils llvm-clang atool docker taskwarrior pkg-config dbus-devel dbus-glib-devel strace vagrant

sudo apt-get -y remove --purge thunderbird rhythmbox gnome-shell-extension-ubuntu-dock

sudo apt-get update

sudo apt-get -y install curl

curl -s https://updates.signal.org/desktop/apt/keys.asc | sudo apt-key add -
echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" | sudo tee -a /etc/apt/sources.list.d/signal-xenial.list

sudo apt-add-repository -y ppa:tista/adapta
sudo add-apt-repository -y ppa:papirus/papirus
sudo add-apt-repository -y ppa:git-core/ppa

sudo apt-get update

sudo DEBIAN_FRONTEND=noninteractive apt-get -y install vim tmux gdb build-essential cmake linux-headers-$(uname --kernel-release) python-dev golang rustc cargo python-pip virtualenv zsh zsh-antigen diffutils tig meld clang  atool pandoc pandoc-citeproc texlive bibtool docker.io taskwarrior timewarrior bugwarrior tasksh evolution strace packer vagrant gnome-tweak-tool breeze-cursor-theme papirus-icon-theme adapta-gtk-theme virtualbox virtualbox-ext-pack virtualbox-guest-additions-iso fonts-roboto libinput-tools xdotool wmctrl signal-desktop tlp powertop libjson-perl arandr libpam-u2f mosh exuberant-ctags hunspell sshfs git-lfs chrome-gnome-shell qemu-kvm

vagrant plugin install winrm
vagrant plugin install winrm-fs

cargo install rls
cargo install rustfmt

git lfs install
git config --global core.editor "vim" 

# taskopen
git clone https://github.com/ValiValpas/taskopen
cd taskopen && make PREFIX=/usr && sudo make PREFIX=/usr install && cd -

# Make Docker happy
sudo usermod -a -G docker $USER
sudo usermod -a -G input $USER

# Install/configure VIM & plugins...
mkdir -p ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
cd ~/.vim/bundle/YouCompleteMe && python ./install.py --clang-completer --go-completer --rust-completer && cd -
vim +PluginInstall +qall

# Install GDB PEDA
git clone https://github.com/longld/peda.git ~/peda
echo "source ~/peda/peda.py" >> ~/.gdbinit
echo "DONE! debug your program with gdb and enjoy"

# Make sure ZSH is happy.
git clone https://github.com/zsh-users/antigen.git ~/antigen
sudo pip install tasklib
sudo pip install selenium
chsh -s $(which zsh)

# NTFY: https://github.com/dschep/ntfy
sudo pip install ntfy

# Make sure tmux is happy.
mkdir -p ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install timewarrior
#sudo snap install timew-spirotot
#sudo snap alias timew-spirotot.timew timew

# Set up taskwarrior
#mkdir -p ~/.task/hooks
#ln -s /snap/timew-spirotot/current/share/doc/timew/ext/on-modify.timewarrior ~/.task/hooks/on-modify.timewarrior
#cp /snap/timew-spirotot/current/share/doc/timew/ext/on-modify.timewarrior ~/.task/hooks/
#chmod +x ~/.task/hooks/on-modify.timewarrior


# And Bugwarrior..
#sudo pip install bugwarrior
#sudo pip install "bugwarrior[keyring]"
cd ~/.config/systemd/user && systemctl --user enable bugwarrior-pull.timer && systemctl --user start bugwarrior-pull.timer && cd -

# And tasksh.
#cd ~/bin && wget https://raw.githubusercontent.com/chihchun/snapcraft-docker/a8d3161a61cb921e1f895742209e66f73c6579e6/snapcraft-docker && chmod +x snapcraft-docker && cd -
#cd /tmp
#git clone https://github.com/Spirotot/tasksh-spirotot.git && cd tasksh-spirotot && snapcraft-docker ./build.sh && sudo snap install --dangerous --classic ./*.snap && cd ~/

#sudo snap alias tasksh-spirotot.tasksh tasksh
#sudo snap alias timew-spirotot.timew timew

# Libinput
git clone http://github.com/bulletmark/libinput-gestures
cd libinput-gestures
sudo ./libinput-gestures-setup install
