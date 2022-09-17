export ZSH="/home/simon/.oh-my-zsh"

ZSH_THEME="jnrowe"
export BAT_THEME="Forest Night"

plugins=(git rust vi-mode)

source $ZSH/oh-my-zsh.sh

# Disable oh-my-zh autocd
unsetopt autocd

#alias
alias cl='clear'
alias lch='firefox http://localhost:8080'
alias xo='xdg-open .'
alias bk='cd ..'
alias lial='rg alias ~/.zshrc'
alias rm='trash'
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

alias lpandoc='pandoc --pdf-engine=lualatex'
alias tmux='tmux -f ~/.config/.tmux.conf'

alias mpvris='mpv --script=/usr/local/include/mpris.so --no-video'
alias tab='xsv table'

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

# Rif alias
alias ra="rif add"
alias rcm="rif commit -m"
alias rs="rif status"
alias rl="rif ls"
alias cb="xclip -sel clip"

# Arch monitor setup
alias mirror="xrandr --output HDMI-1 --same-as eDP-1"

alias marp="/home/simon/misc/gde/renderers/marp/bin/marp"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/simon/.conda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/simon/.conda/etc/profile.d/conda.sh" ]; then
        . "/home/simon/.conda/etc/profile.d/conda.sh"
    else
        export PATH="/home/simon/.conda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export shellcheck="shellharden"

# Lua
alias lua=luajit
eval "$(luarocks path --bin)"

# Zoxide
eval "$(zoxide init zsh)"

export RADO_EDITOR=nvim

alias rr='rado read'
alias re='rado edit'
alias nb='newsboat'

export PAGER='most'

LS_COLORS='rs=0:di=00;32:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=00:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.avif=01;35:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:*~=00;90:*#=00;90:*.bak=00;90:*.old=00;90:*.orig=00;90:*.part=00;90:*.rej=00;90:*.swp=00;90:*.tmp=00;90:*.dpkg-dist=00;90:*.dpkg-old=00;90:*.ucf-dist=00;90:*.ucf-new=00;90:*.ucf-old=00;90:*.rpmnew=00;90:*.rpmorig=00;90:*.rpmsave=00;90:';
export LS_COLORS

alias nnn='nnn -e'

alias nvf='cd ~/.config/nvim/ && nvim init.lua'
alias nano='nvim'
# Disable mouse for 0.5 second if key was given
# This is a temporary fix but I couldn't help it
alias nokey='syndaemon -i 0.5 -t -K -R'
