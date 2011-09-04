# If not running interactively, don't do anything
if [[ -n $PS1 ]]; then

 set -o ignoreeof
 set -o noclobber
 set -o vi

 # don't put duplicate lines in the history. See bash(1) for more options
 export HISTCONTROL=ignoreboth
 HISTIGNORE="[   ]*:&:bg:fg"

 # check the window size after each command and, if necessary,
 # update the values of LINES and COLUMNS.
 shopt -s checkwinsize

 # enable color support of ls and also add handy aliases
 if [ "$TERM" != "dumb" ]; then
    alias ls='ls -FG'
 fi

 alias   cc="gcc"
 alias   l='ls -l'
 alias   ll='ls -lA'
 alias   vi="vim"

 source ~/.git-completion.sh

 WHITE="\[\033[1;37m\]"
 GREY="\[\033[0;38m\]"
 BLUE="\[\033[0;36m\]"

 PS1="$WHITE\u@\h \w $BLUE"'$(__git_ps1 "(%s) ")'"$WHITE\$ $GREY"

 # If this is an xterm set the title to user@host:dir
 case $TERM in
 xterm*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
    ;;
 *)
    ;;
 esac

 readman()
 {
    for file in $@
    do
    if [ $(echo $file | egrep -i 'gz$') ]
    then # compressed
        gzip -cdq $file | groff -Tascii -mandoc | less
    else # not compressed
        groff -Tascii -mandoc $file | less
    fi
    done
 }

 [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
fi
