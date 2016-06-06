# dotFiles

Working on enumerating useful packages to use to get things rolling upon installation...

yaourt -S zsh mosh cmake git vim dmenu i3-wm i3lock i3status python-pip tig
firefox meld sshfs numlockx mpg123 task uuid-evd ttf-inconsolata
keychain taskopen xorg-server xorg-xinit arandr vundle py3status networkmanager
networkmanager-openconnect nm-connection-editor network-manager-applet
alsa-utils thunderbird dns-utils rsync dunst linux-headers scrot shutter
python2-xcffib python2-pillow davmail redshift-gtk the_silver_searcher
lxappearance gtk-theme-arc feh i3lock-fancy-git

sudo pip install py3status (or from repos, that might be better.)
sudo pip2 install tasklib

urxvt-perls, urxvt-vtwheel, antigen-git

# Installing this repo
1. `cd ~/`
2. `git remote add origin https://github.com/Spirotot/dotFiles.git`
3. `git submodule update --init --recursive --remote`
4. `git checkout -t origin/[branch]`


# YouCompleteMe installation
1. https://github.com/Valloric/YouCompleteMe#ubuntu-linux-x64-super-quick-installation
2. `vim +BundleInstall +qall` (Thanks to http://christopherpoole.github.io/setting-up-vim-with-YouCompleteMe/)

# TaskWarrior

We need to install most TaskWarrior things from source to make sure that everything works with [taskwiki](https://github.com/tbabej/taskwiki).

## TaskWarrior installation
1. Grab latest stable release from http://taskwarrior.org/download (must be v2.4.0 or greater to work with our setup...) `wget http://taskwarrior.org/download/task-2.4.4.tar.gz`
2. Remove any installed versions if necessary. `sudo apt-get remove --purge task`
3. `unp task-2.4.4.tar.gz && rm task-2.4.4.tar.gz`
4. `cd task-2.4.4 && cmake -DCMAKE_BUILD_TYPE=release . && make -j8 && sudo make install`

## tasklib installation
Need 'develop' branch from GitHub for [taskwiki](https://github.com/tbabej/taskwiki) to work properly.

1. `cd ~/.vim/bundle`
2. (if the submodule didn't do it's thing like it's supposed to...) `git clone https://github.com/tbabej/tasklib.git && cd tasklib && git checkout develop && cd ../`
3. `cd tasklib && sudo python setup.py build && sudo python setup.py install`

## Firefox

1. Install [Arc Dark](https://addons.mozilla.org/en-US/firefox/addon/arc-dark-theme/?src=cb-dl-users) theme.
2. Symlink between `~/bin/userChrome.css` and `~/.mozilla/firefox/[profile]/chrome/userChrome.css` (may have to create `chrome` dir).

## Thunderbird

1. Need to install [Custom
   Buttons](https://addons.mozilla.org/en-US/thunderbird/addon/custom-buttons/)
   plugin.
2. Create a custom button using the
   [tb2taskwarrior_button](./bin/custom-tb2taskwarrior_button.js).
3. Add a hotkey to the button (Ctrl+t).

# Misc
1. `git config --global core.editor "vim"` # Make vim default git editor.
2. `git config --global merge.tool meld` # Make meld the default git mergetool.
3. Disable PC speaker:
   https://wiki.archlinux.org/index.php/Disable_PC_speaker_beep#Globally
4. [Enable IPv6 Privacy
   Extensions](https://wiki.archlinux.org/index.php/IPv6#Privacy_extensions)
5. Adjust VGA monitors: https://superuser.com/questions/733201/two-identical-external-monitors-one-through-hdmi-another-vga-text-on-vga-looks (http://techmind.org/lcd/phasing.html)
6. Uncomment 'en_US.UTF-8' in `/etc/local.gen`, and then re-run `sudo local-gen`.
7. `sudo systemctl enable NetworkManager` to start Network Manager on boot.



## Invalid signature on packages.
Try updating your system GPG keys with `sudo pacman-key --refresh-keys`.

If you're blocked by a firewall, edit the server in
`/etc/pacman.d/gnupg/gpg.conf` to use the following server:
`https://gpgtools.tenderapp.com/kb/faq/cant-reach-key-server-are-you-behind-a-company-firewall`
