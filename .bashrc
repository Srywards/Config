#!/bin/bash

ulimit -c 0

export PATH="/bin:/sbin:/usr/bin:/usr/sbin:/usr/heimdal/bin:/usr/heimdal/sbin"

export EDITOR='emacs'
export HISTSIZE=1000
export MAIL="/u/all/${USER}/mail/${USER}"
export PAGER='more'
export SAVEHIST=1000
export WATCH='all'

alias ls='ls --color'
alias ll='ls -l'
alias la='ls -la'
alias j='jobs'
alias emacs='emacs -nw'
alias ne='emacs'
alias source='source ~/.bashrc'
alias poule='git pull'
alias cl='mr_clean'
alias pu='push_that.sh'
alias lk='~/Downloads/i3lock/scripti3.sh'
alias bashrc='emacs ~/.bashrc'
alias ..='cd ..'
alias wifi='nm-applet'
alias sound='pavucontrol'
alias config='neofetch'
alias sql='sudo kitematic'
alias leave='shutdown now'
alias 144='xrandr --output DP-1 --mode 1920x1080 --rate 144.00'
alias temp='sensors'

ifsegfault()
{
    if [ `echo $?` -eq 139 ]
    then
	ffplay -nodisp -loglevel panic /bin/oui.wav &
    fi
}

PROMPT_COMMAND="ifsegfault"

if [ -f ${HOME}/.mybashrc ]
then
    . ${HOME}/.mybashrc
fi

LS_COLORS=$LS_COLORS:'ex=36:di=34:' ; export LS_COLORS
append_path_env_var()
{
	ENV_VAR=`printenv $1`
	CONTENT=$2
	if [[ ! -z $ENV_VAR ]]
	then
			CONTENT=$ENV_VAR:${2}
	fi
	export ${1}=$CONTENT
}
append_path_env_var()
{
	ENV_VAR=`printenv $1`
	CONTENT=$2
	if [[ ! -z $ENV_VAR ]]
	then
			CONTENT=$ENV_VAR:${2}
	fi
	export ${1}=$CONTENT
}
append_path_env_var()
{
	ENV_VAR=`printenv $1`
	CONTENT=$2
	if [[ ! -z $ENV_VAR ]]
	then
			CONTENT=$ENV_VAR:${2}
	fi
	export ${1}=$CONTENT
}
### C Graphical Programming Environement Variable
append_path_env_var "LIBRARY_PATH" "/home/clem/.graph_programming/lib"
append_path_env_var "LD_LIBRARY_PATH" "/home/clem/.graph_programming/lib"
append_path_env_var "CPATH" "/home/clem/.graph_programming/include"

gb() {
        echo -n ' (' && git branch 2>/dev/null | grep '^*' | colrm 1 2 | tr -d '\n' && echo  -n ') '
}
git_branch() {
        gb | sed 's/() //'
}

PROMPT_COMMAND=__prompt_command

__prompt_command() {
    local EXIT="$?"

    local Brown='\[\e[0;33m\]'
    local Blue='\[\e[0;34m\]'
    local BYel='\[\e[1;34m\]'
    local Noc='\[\e[0m\]'

    PS1="\[\e[00;37m\]\u\[\e[01;37m\]:\[\e[01;34m\]\w\$(git_branch)"

    if [ $EXIT != 0 ]; then
        PS1+="[${Brown}$EXIT${BYel}]\\$ "
    else
        PS1+="[${Blue}$EXIT${BYel}]\\$ "
    fi
    PS1+="${Noc}"
}
