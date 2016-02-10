# dotFiles

Working on enumerating useful packages to use to get things rolling upon installation...

sudo apt-get install zsh openssh-server mosh build-essential cmake python-dev git vim dmenu i3-wm i3lock i3status python-pip fonts-inconsolata tig chromium-browser meld sshfs numlockx mpg123 task uuid-dev exuberant-ctags

sudo pip install py3status

urxvt-perls, urxvt-vtwheel

#Installing this repo
1. `cd ~/`
2. `git remote add origin https://github.com/Spirotot/dotFiles.git`
3. `git submodule update --init --recursive --remote`
4. `git checkout -t origin/[branch]`


#YouCompleteMe installation
1. https://github.com/Valloric/YouCompleteMe#ubuntu-linux-x64-super-quick-installation
2. `vim +BundleInstall +qall` (Thanks to http://christopherpoole.github.io/setting-up-vim-with-YouCompleteMe/)

#TaskWarrior
We need to install most TaskWarrior things from source to make sure that everything works with [taskwiki](https://github.com/tbabej/taskwiki).
##TaskWarrior installation
1. Grab latest stable release from http://taskwarrior.org/download (must be v2.4.0 or greater to work with our setup...) `wget http://taskwarrior.org/download/task-2.4.4.tar.gz`
2. Remove any installed versions if necessary. `sudo apt-get remove --purge task`
3. `unp task-2.4.4.tar.gz && rm task-2.4.4.tar.gz`
4. `cd task-2.4.4 && cmake -DCMAKE_BUILD_TYPE=release . && make -j8 && sudo make install`

##tasklib installation
Need 'develop' branch from GitHub for [taskwiki](https://github.com/tbabej/taskwiki) to work properly.

1. `cd ~/.vim/bundle`
2. (if the submodule didn't do it's thing like it's supposed to...) `git clone https://github.com/tbabej/tasklib.git && cd tasklib && git checkout develop && cd ../`
3. `cd tasklib && sudo python setup.py build && sudo python setup.py install`

#Solarized Colors
1. `cd ~/solarized/gnome-terminal-colors-solarized`
2. `./install.sh` # follow prompts.
3. `cp ~/solarized/vim-colors-solarized/colors/solarized.vim ~/.vim/colors/solarized.vim` # Installs vim colors.

#Misc
1. `git config --global core.editor "vim"` # Make vim default git editor.
2. `git config --global merge.tool meld` # Make meld the default git mergetool.
3. Disable PC speaker:
   https://wiki.archlinux.org/index.php/Disable_PC_speaker_beep#Globally

## Invalid signature on packages.
Try updating your system GPG keys with `sudo pacman-key --refresh-keys`.

If you're blocked by a firewall, edit the server in
`/etc/pacman.d/gnupg/gpg.conf` to use the following server:
`https://gpgtools.tenderapp.com/kb/faq/cant-reach-key-server-are-you-behind-a-company-firewall`
