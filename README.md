# dotFiles

Working on enumerating useful packages to use to get things rolling upon installation...

sudo apt-get install zsh openssh-server mosh build-essential cmake python-dev git vim dmenu i3-wm i3lock i3status python-pip fonts-inconsolata tig chromium-browser meld sshfs

sudo pip install py3status

#Installing this repo
1. `cd ~/`
2. `git remote add origin https://github.com/Spirotot/dotFiles.git`
3. `git submodule update --init --recursive`
4. `git checkout -t origin/[branch]`


#YouCompleteMe installation
1. https://github.com/Valloric/YouCompleteMe#ubuntu-linux-x64-super-quick-installation
2. `vim +BundleInstall +qall` (Thanks to http://christopherpoole.github.io/setting-up-vim-with-YouCompleteMe/)

#Solarized Colors
1. `cd ~/solarized/gnome-terminal-colors-solarized`
2. `./install.sh` # follow prompts.
3. `cp ~/solarized/vim-colors-solarized/colors/solarized.vim ~/.vim/colors/solarized.vim` # Installs vim colors.

#Misc
1. `git config --global core.editor "vim"` # Make vim default git editor.
2. `git config --global merge.tool meld` # Make meld the default git mergetool.
