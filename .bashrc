# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

if [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
fi

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

xhost +local:root > /dev/null 2>&1

complete -cf sudo

shopt -s cdspell
shopt -s checkwinsize
shopt -s dotglob
shopt -s expand_aliases
shopt -s extglob
shopt -s hostcomplete
shopt -s nocaseglob

# append history, don't overwrite
shopt -s histappend
# one command per line
shopt -s cmdhist

export HISTSIZE=100000
export HISTFILESIZE=1000000
export HISTCONTROL=ignoreboth:erasedups
export HISTIGNORE="&:ls:[bf]g:exit:su:ls -[lha]:ls -h[al]:ls -a[hl]: "
export HISTTIMEFORMAT="%F %T "
# save history immediately
export PROMPT_COMMAND='history -a'

export EDITOR=nano

export LC_COLLATE="C"

# wrap long lines in journalctl
export SYSTEMD_LESS=FRXMK

export LESS=" -R"

# extract - archive extractor
# usage: extract <file>
function extract() {
	if [ -f $1 ]
	then
		case $1 in
			*.tar.bz2)   tar xjf $1   ;;
			*.tar.gz)    tar xzf $1   ;;
			*.bz2)       bunzip2 $1   ;;
			*.rar)       unrar x $1     ;;
			*.gz)        gunzip $1    ;;
			*.tar)       tar xf $1    ;;
			*.tbz2)      tar xjf $1   ;;
			*.tgz)       tar xzf $1   ;;
			*.zip)       unzip $1     ;;
			*.Z)         uncompress $1;;
			*.7z)        7z x $1      ;;
			*)           echo "'$1' cannot be extracted via extract()" ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}

# make directory and move into it
function mkcdr {
	mkdir -p -v $1
	cd $1
}

# create an archive from given directory
function mktar() {
	tar cvf "${1%%/}.tar" "${1%%/}/"
}
function mktgz() {
	tar cvzf "${1%%/}.tar" "${1%%/}/"
}
function mktbz() {
	tar cvjf "${1%%/}.tar" "${1%%/}/"
}

# regular prompt
PS1='\[\033[00;31m\][ \[\033[00;97m\]!\! \[\033[00;31m\]] \[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] '
# root prompt
# root prompt
#PS1="\[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;1m\][\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;9m\]\h\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;39m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;1m\]]\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;9m\]\\$\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"


