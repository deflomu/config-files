alias ll='ls -la'
alias lh='ls -lah'
alias ...='cd ../..'
alias less='less -R'
alias grep='grep --color'

alias s='su --preserve-environment root'

alias homegit='git --git-dir=$HOME/.home.git --work-tree=$HOME'

if type ack > /dev/null; then
    alias grep='ack'
fi
