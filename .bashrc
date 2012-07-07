# elm's bashrc
# Inspired by:
# https://github.com/l0b0/tilde/blob/master/.bashrc
# https://github.com/git/git/tree/master/contrib/completion

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# define colors used in PS1
c_red="\[$(tput setaf 1)\]"
c_green="\[$(tput setaf 2)\]"
c_sgr0="\[$(tput sgr0)\]"

# Load git-completion.bash
source "$HOME/.git-completion.bash"
# Display dirty state, if something is stashed and of we are ahead or behind of
# upstream.
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUPSTREAM="auto"

PS1="${c_green}\u${c_sgr0}:${c_green}\W${c_sgr0}\$(__git_ps1 '(%s)')${c_green}\$${c_sgr0} "

# set exports
export EDITOR=vim
export INPUTRC=~/.inputrc
export CLICOLOR=1
# set most as pager if available
command -v most >/dev/null 2>&1 && export PAGER=most

# System specific settings are set in .bashrc_local
if [ -r "$HOME/.bashrc_local" ]
then
    source "$HOME/.bashrc_local"
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# automatically attach to running screen
#if [ $SSH_TTY ] && [ ! $WINDOW ]; then
# SCREENLIST=$(screen -ls | grep 'Attached')
# if [ $? -eq "0" ]; then
#  echo -e "Screen is already running and attached:\n ${SCREENLIST}"
# else
#  screen -U -R
# fi
#fi

if [ "$PS1" != "" -a "${STARTED_TMUX:-x}" = x -a "${SSH_TTY:-x}" != x ]
then
	STARTED_TMUX=1; export STARTED_TMUX
	sleep 1
	( (tmux has-session -t remote && tmux attach-session -t remote) || (tmux new-session -s remote) ) && exit 0
	echo "tmux failed to start"
fi
