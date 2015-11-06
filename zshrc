# ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  == 
# this is my zshrc
#  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  == 
case $TERM in 
    xterm*) TERM=xterm-256color ;; 
    screen*) TERM=screen-256color ;; 
esac 


alias -s tar='tar -xzvf'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ll='ls -alFt'
alias la='ls -a'
alias l='ls -CF'
alias tree='tree -C'
alias v='vim' 
alias cp="cp -i" 
alias mv="mv -i" 
alias rm="rm -i"
alias gv='gvim'
alias ...="cd ../.."
alias gvim="gvim -f"
alias ~="cd ~"
#alias -="cd -"
alias gg="exit"
alias zhuomian="cd 桌面"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'
fi

#历史记录文件
HISTFILE=~/.zsh_history 
#历史记录条目数量
HISTSIZE=1000
#注销后保存的历史记录条目数量
SAVEHIST=2000
#相同的历史路径只保留一个
setopt PUSHD_IGNORE_DUPS
#如果连续输入的命令相同，历史记录中只保留一个
setopt HIST_IGNORE_DUPS


bindkey -v
 
#bindkey "^[OH" beginning-of-line 
#bindkey "^[OF" end-of-line
#设置del键为向后删除
#bindkey "^[[3~" delete-char 
bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

#autoload compinit && compinit
autoload -U promptinit
promptinit
#zstyle ':completion:*' menu select 


setopt autocd 
#启用cd命令的历史记录，cd - 【TAB】进入历史路径
setopt autopushd 
setopt cdablevars 
setopt correct 
setopt globdots 
setopt extendedglob
#允许在交互模式下使用注释
setopt interactivecomments 
setopt completeinword 
setopt nobeep 
setopt multios 
#自动补全功能
setopt AUTO_LIST
setopt AUTO_MENU


#在命令前插入sudo
#sudo-command-line() {
#[[ -z $BUFFER ]] && zle up-history
#[[ $BUFFER != sudo \ * ]] && BUFFER="sudo $BUFFER"
#zle end-of-line
#}
#zle -N sudo-command-line
#bindkey "\e\e" sudo-command-line


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

export PATH=/opt/bin:$PATH
export ndk=/home/larry_chen/src/ndk

export PATH=/home/larry_chen/android/android-studio/bin/:$PATH
