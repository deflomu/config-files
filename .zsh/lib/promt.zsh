# autoload -U add-zsh-hook
autoload -Uz vcs_info

# # enable VCS systems you use
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:*:prompt:*' check-for-changes true

setopt prompt_subst
autoload -U promptinit
promptinit

source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
function get_cluster() {
    if [[ "$1" == "konfederation" ]]; then
        echo "k"
    else
        echo "$1"
    fi
}

KUBE_PS1_CLUSTER_FUNCTION=get_cluster
KUBE_PS1_SYMBOL_ENABLE=false

# Look at http://zsh.sourceforge.net/Doc/Release/User-Contributions.html#Version-Control-Information
# for mor options
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '*'   # display this when there are unstaged changes
zstyle ':vcs_info:*' stagedstr '+'  # display this when there are staged changes
zstyle ':vcs_info:*' actionformats '[%b%|%a%c%u%]%f'
zstyle ':vcs_info:*' formats ':%b%c%u%f'


zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'
precmd () { vcs_info }

prompt_context() {
  local user=`whoami`

  if [[ "$user" != "$DEFAULT_USER" || -n "$SSH_CONNECTION" ]]; then
    echo -n "%{$fg[green]%}%n%{$reset_color%}@%{$fg[blue]%}%m%{$reset_color%}:"
  fi
}


PROMPT='$(prompt_context)%{$fg[green]%}%1~%{$reset_color%}${vcs_info_msg_0_}$(kube_ps1)%{$fg[green]%}$ %{$reset_color%}'

# Enable time reporting for commands that take longer than 10 seconds to
# execute
REPORTTIME=10
