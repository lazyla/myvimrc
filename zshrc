# ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  == 
# this is my zshrc
#  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  == 
case $TERM in 
    xterm*) TERM=xterm-256color ;; 
    screen*) TERM=screen-256color ;; 
esac 

alias grep='grep -E --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ll='ls -alt'
alias la='ls -A'
alias l='ls -CF'
alias tree='tree -C'
alias v='vim' 
alias cp="cp -i" 
alias mv="mv -i" 
alias rm="rm -i"
alias gvim="gvim -f"
alias ...="cd ../.."
alias ..="cd .."
alias ~="cd ~"
alias gg="exit"
alias zhuomian="cd 桌面"

#历史记录文件
HISTFILE=~/.zsh_history 
#历史记录条目数量
HISTSIZE=1000
#注销后保存的历史记录条目数量
SAVEHIST=2000
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

PS1=$'%{\e[1;32m%}%n@%M%{\e[0m%}%{\e[1;34m%}:%{\e[0m%}%{\e[1;33m%}%~%{\e[0m%}%{\e[1;31m%}\n$%{\e[0m%} '
#backup#PS1=$'%{\e[1;32m%}%n@%M%{\e[0m%}%{\e[1;33m%}:%{\e[0m%}%{\e[1;32m%}%~%{\e[0m%}%{\e[1;33m%}\n$%{\e[0m%} '
#PS1="\[\e[1;31m\][\[\e[1;32m\]\u@\h:\[\e[1;34m\]\w\[\e[1;31m\]]\[\e[1;32m\]\n\$ \[\e[0m\]"

#export JAVA_HOME=/opt/jdk1.6.0_26
#export JRE_HOME=/opt/jdk1.6.0_26/jre
#export CLASSPATH=.:$JAVA_HOME/lib/:$JRE_HOME/lib:$CLASSPATH
#export PATH=$JAVA_HOME/bin/:$JRE_HOME/bin/:$PATH
#export ANDROID_JAVA_HOME=$JAVA_HOME
export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64
export JRE_HOME=/usr/lib/jvm/java-7-openjdk-amd64/jre
export CLASSPATH=.:$JAVA_HOME/lib:$JRE_HOME/lib:$CLASSPATH
export PATH=$HOME/bin:$JAVA_HOME/bin:$JRE_HOME/bin:$PATH
export ANDROID_JAVA_HOME=$JAVA_HOME
export PATH=/sbin:$PATH

export PATH=/opt/bin:$PATH
export ndk=/home/larry_chen/src/ndk
