export ZSH=~/.zsh

# Load all of the config files in ~/lib that end in .zsh
for config_file ($ZSH/lib/*.zsh) source $config_file

export PATH=$PATH:$HOME/.bin

# Load and run compinit
autoload -U compinit
compinit -i

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "$HOME/.gvm/bin/gvm-init.sh" ]] && source "$HOME/.gvm/bin/gvm-init.sh"

PERL_MB_OPT="--install_base \"$HOME/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"; export PERL_MM_OPT;

export DEFAULT_USER="$(whoami)"

export LANG="de_DE.UTF-8"

export NODE_BUILD_DEFINITIONS="/usr/local/opt/node-build-update-defs/share/node-build"
eval "$(nodenv init -)"

export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform

export PATH=~/Library/Application\ Support/Coursier/bin/:"$PATH"

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true

source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc
source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc

export PNPM_HOME="$HOME/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
eval "$(direnv hook zsh)"

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

