alias ll='ls -la'
alias lh='ls -lah'
alias ...='cd ../..'
alias less='less -R'

alias s='su --preserve-environment root'

alias homegit='git --git-dir=$HOME/.home.git --work-tree=$HOME'

upgrade() {
	su -c "apt-get update && apt-get dist-upgrade && apt-get autoclean && apt-get autoremove"
}
