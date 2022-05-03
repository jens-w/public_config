# reload bash config
alias rld="source ~/.bashrc"

alias ls='ls -h --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias ll='ls -l'
alias lla='ll -A'
alias llA='ll -a'

alias df='df -h'
alias du='du -h -c'
alias biggest='BLOCKSIZE=1048576; du -x | sort -nr | head -10'

alias freem='free -m'

alias grep='grep --color=tty -d skip'

# confirmation before doing something
alias cpi='cp -i'
alias mvi='mv -i'
alias rmi='rm -i'

alias nano='nano -W -S -A -O -i -w -c'
alias nanoi='/usr/bin/nano'

alias wget='wget -c'

alias back='cd $OLDPWD'
alias bck='cd $OLDPWD'
alias ..='cd ..'
alias ...='cd ../..'

# tmux
alias tmuxnew="tmux new -s" 
alias tmuxatt="tmux attach -t"
alias tmuxls="tmux list-sessions" 
alias tmuxsplitv="tmux split-window"
alias tmuxsplith="tmux split-window -h"
