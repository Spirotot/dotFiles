# Path to your oh-my-zsh installation.
#set -x
#source ~/.antigen/antigen.zsh
source /usr/share/zsh/scripts/antigen/antigen.zsh
#http://www.lowlevelmanager.com/2012/04/zsh-history-extend-and-persist.html
setopt APPEND_HISTORY
setopt inc_append_history
setopt MENU_COMPLETE
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus
HISTSIZE=120000
SAVEHIST=100000
HISTFILE=~/.zsh_history
setopt HIST_EXPIRE_DUPS_FIRST
setopt EXTENDED_HISTORY

#window titles...
source ~/.antigen/repos/https-COLON--SLASH--SLASH-github.com-SLASH-robbyrussell-SLASH-oh-my-zsh.git/lib/termsupport.zsh
alias vi=vim
alias ls="ls -F --color"
alias tl="task list"
alias tn="task"
alias xo="xdg-open"
alias b="git branch"
alias systemupdate="yaourt -Syua"
antigen bundle git
antigen bundle docker
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions src
antigen bundle pip
antigen bundle command-not-found
antigen bundle taskwarrior
antigen bundle python
antigen bundle systemd
antigen bundle gnu-utils
antigen bundle joel-porquet/zsh-dircolors-solarized # This uses `dircolors` to populate LS_COLORS with the proper solarized colors...
source ~/.antigen/repos/https-COLON--SLASH--SLASH-github.com-SLASH-robbyrussell-SLASH-oh-my-zsh.git/lib/nvm.zsh
autoload -U colors && colors # https://stackoverflow.com/questions/26829821/zsh-theme-not-working-properly-on-osx
antigen theme bureau
#antigen theme blinks
#export TERM=rxvt-unicode-256color

autoload -Uz compinit
compinit

antigen apply
eval `dircolors ~/.antigen/repos/https-COLON--SLASH--SLASH-github.com-SLASH-joel-porquet-SLASH-zsh-dircolors-solarized.git/dircolors-solarized/dircolors.ansi-dark`
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
zstyle ':completion:*' menu select

# https://github.com/nviennot/zsh-config/blob/master/lib/completion.zsh
unsetopt menu_complete
setopt auto_menu
setopt complete_in_word
setopt always_to_end
if [ "x$CASE_SENSITIVE" = "xtrue" ]; then
  zstyle ':completion:*' matcher-list 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
  unset CASE_SENSITIVE
else
  if [ "x$HYPHEN_INSENSITIVE" = "xtrue" ]; then
    zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
    unset HYPHEN_INSENSITIVE
  else
    zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
  fi
fi
function ta() {
    task add $@
}

function calc () {
    bc <<< "$@"
}

function h() {
    hamster $@
}

#http://calnewport.com/blog/2013/12/21/deep-habits-the-importance-of-planning-every-minute-of-your-work-day/
function godeep() {
    if [[ "$1"X == "X" ]]
    then
        f=`date +%Y-%m-%d_%T`.md
    else
        f=$1.md
    fi
    cp -n ~/bin/deep_template.md $f # -n, do not overwrite an existing file.
    vi $f
}

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="bureau"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
 ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
 #COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#plugins=(git)

#source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/home/fieldad1/bin/jdk1.7.0_45/bin/:/home/fieldad1/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/fieldad1/bin/:/home/fieldad1/.cabal/bin/"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

sshmounthome ()
{
    user=`whoami`
    host=$1
    remotepath=/home/$user
    localpath=/home/$user/mnt/$host

    if [ ! -d $localpath ]; then
        #sudo ln -s /media/$user ~/mnt
        sudo mkdir -p $localpath
        sudo chown -R $user $localpath
    fi
    sshfs $host:$remotepath $localpath
    cd $localpath
}

# Load zsh-syntax-highlighting.
#source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Load zsh-autosuggestions.
#source ~/.zsh/zsh-autosuggestions/autosuggestions.zsh


#AUTOSUGGESTION_HIGHLIGHT_COLOR='fg=5,bg=2'

# Enable autosuggestions automatically.
#zle-line-init() {
#    zle autosuggest-start
#}
#zle -N zle-line-init
#

bindkey '^[[1~' beginning-of-line
bindkey '^[[4~' end-of-line

bindkey -v

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
    curdir=`pwd`
    user=`whoami`
    if [[ $curdir == /home/$user/mnt/* ]]; then
        ssh-keygen -F `basename $curdir` > /dev/null 2>&1
        if [ $? -eq 0 ]; then
            RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
        fi
    else
        RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}$(bureau_git_prompt) $EPS1"
    fi
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1

bindkey '^[[Z' reverse-menu-complete
