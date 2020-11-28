# Custom config
# Save history for zsh
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# This enables search history with several characters to serach a whole line
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search # Up
bindkey "${terminfo[kcud1]}" down-line-or-beginning-search # Down

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

# Read Bash_Profile for paths
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

source /home/simon/misc/vulkan/1.2.148.1/setup-env.sh

# Start starship
eval "$(starship init zsh)"
source /home/simon/.zsh/completion.zsh
