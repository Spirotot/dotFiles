# dotFiles

Working on enumerating useful packages to use to get things rolling upon installation...

zsh openssh-server mosh build-essential cmake python-dev git i3-wm vim dmenu i3-wm i3lock i3status

#Installing this repo
cd ~/
git remote add origin https://github.com/Spirotot/dotFiles.git
git submodule update --init --recursive
git checkout -t origin/[branch]


#YouCompleteMe installation
1. https://github.com/Valloric/YouCompleteMe#ubuntu-linux-x64-super-quick-installation
2. `vim +BundleInstall +qall` (Thanks to http://christopherpoole.github.io/setting-up-vim-with-YouCompleteMe/)
