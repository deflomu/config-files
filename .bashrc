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
c_red="$(tput setaf 1)"
c_green="$(tput setaf 2)"
c_sgr0="$(tput sgr0)"

# get current git branch and indicate if it's dirty
function parse_git_branch ()
{
	if git rev-parse --git-dir >/dev/null 2>&1
	then
		gitver=$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')
		if git diff --quiet 2>/dev/null >&2
		then
			gitver=${c_sgr0}'('$gitver')'
		else
			gitver=${c_sgr0}'('${c_red}$gitver${c_sgr0}')'
		fi
	else
		return 0
	fi
	echo $gitver
}

PS1="${c_green}\u${c_sgr0}:${c_green}\W\$(parse_git_branch)${c_green}\$${c_sgr0} "

export EDITOR=vim

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
if [ $SSH_TTY ] && [ ! $WINDOW ]; then
 SCREENLIST=$(screen -ls | grep 'Attached')
 if [ $? -eq "0" ]; then
  echo -e "Screen is already running and attached:\n ${SCREENLIST}"
 else
  screen -U -R
 fi
fi
