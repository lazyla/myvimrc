# ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  == 
# this is my zshrc
#  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  == 
case $TERM in 
    xterm*) TERM=xterm-256color ;; 
    screen*) TERM=screen-256color ;; 
esac 

alias grep='grep -E --color=auto' \ 
alias fgrep='fgrep --color=auto' \ 
alias egrep='egrep --color=auto' \ 
alias ll='ls -lh' \ 
alias la='ls -A' \ 
alias l='ls -CF' \ 
alias tree='tree -C' \ 
alias v='vi' 
alias cp="cp -i" 
alias mv="mv -i" 
alias rm="rm -i"

#历史记录文件
HISTFILE=~/.zsh_history 
#历史记录条目数量
HISTSIZE=10000
#注销后保存的历史记录条目数量
SAVEHIST=10000
bindkey -v
 
bindkey "^[OH" beginning-of-line 
bindkey "^[OF" end-of-line 
bindkey "^[[3~" delete-char 

autoload compinit && compinit 
zstyle ':completion:*' menu select 


setopt autocd 
setopt autopushd 
setopt cdablevars 
setopt correct 
setopt globdots 
setopt extendedglob 
setopt interactivecomments 
setopt completeinword 
setopt nobeep 
setopt multios 
setopt AUTO_LIST
setopt AUTO_MENU

PS1=$'%{\e[1;32m%}%n@%M%{\e[0m%}%{\e[1;33m%}:%{\e[0m%}%{\e[1;32m%}%~%{\e[0m%}%{\e[1;33m%}\n$%{\e[0m%} ' 

