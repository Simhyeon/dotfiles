export ZSH="/home/simon/.oh-my-zsh"

ZSH_THEME="robbyrussell"
export BAT_THEME="gruvbox-light"

plugins=(git rust cargo vi-mode)

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
alias cvim='vim -u NONE'
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
alias cr='cargo run'

alias ssh='TERM=xterm-256color ssh'

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

alias update="pacman -Syu"

# Deno
export DENO_INSTALL="/home/simon/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# Rif alias
alias ra="rif add"
alias rcm="rif commit -m"
alias rs="rif status"
alias rl="rif ls"
