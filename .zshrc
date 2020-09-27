export ZSH="/home/simon/.oh-my-zsh"

ZSH_THEME="robbyrussell"

# BULLETTRAIN VARIABLES
#BULLETTRAIN_PROMPT_ORDER=(
#  context
#  dir
#  git
#)
#BULLETTRAIN_CONTEXT_FG="white"
#BULLETTRAIN_DIR_BG="cyan"
#BULLETTRAIN_DIR_FG="black"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git rust cargo)

source $ZSH/oh-my-zsh.sh

#alias
alias cl='clear'
alias lch='firefox http://localhost:8080'
alias xo='xdg-open .'
alias bk='cd ..'
alias lial='rg alias ~/.zshrc'
alias rm='trash'
alias ezkeymap='xmodmap /home/simon/.Xmodmap'
alias guikeymap='setxkbmap -option'
alias vim='nvim'
alias sdown='shutdown -h now'
alias tsl='task list'
alias gtermcolor='bash -c  "$(wget -qO- https://git.io/vQgMr)"'
alias apsh='apt search'
alias cat='bat'
alias ls='exa'
alias grep='rg'
alias netest='ping 1.1.1.1'
alias rn='ranger'
alias untar='tar -xvf'
# alias fd='fdfind'
alias vlc='vlc --no-instance'
alias rtop='radeontop'
alias xc='xclip -selection c'
alias dud='du -sh .'
alias dfi='/usr/bin/git --git-dir=$HOME/misc/dotfiles --work-tree=$HOME'
alias dfipull='/usr/bin/git --git-dir=$HOME/misc/dotfiles --work-tree=$HOME pull && rm -f $HOME/readme.md $HOME/keyboard_layout.png'

alias bandwhich='sudo $HOME/.cargo/bin/bandwhich'
alias toodr='ssh odroid@odroid.local'
alias lpandoc='pandoc --pdf-engine=lualatex'
alias tmux='tmux -f ~/.config/.tmux.conf'

alias mpvris='mpv --script=/usr/local/include/mpris.so --no-video'

# git aliases
alias gs='git status'
alias gd='git diff'
alias ga='git add'
alias gcm='git commit -m'
alias gp='git push'

# cargo aliases
alias cgm='cargo make'
alias cga='cargo add'

# openvpn
alias vpn='sudo openvpn --config /etc/openvpn/client.conf'

# Read Bash_Profile which means reading paths

if [ -f ~/.bash_profile ]; then 
    . ~/.bash_profile;
fi

if [ -f ~/.dmenu_env ]; then 
    . ~/.dmenu_env;
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/simon/.sdkman"
[[ -s "/home/simon/.sdkman/bin/sdkman-init.sh" ]] && source "/home/simon/.sdkman/bin/sdkman-init.sh"
