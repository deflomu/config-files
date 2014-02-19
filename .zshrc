export ZSH=~/.zsh

# Load all of the config files in ~/oh-my-zsh that end in .zsh
for config_file ($ZSH/lib/*.zsh) source $config_file

export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# Load and run compinit
autoload -U compinit
compinit -i

# Android
export ANDROID_HOME=/usr/local/opt/android-sdk

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "$HOME/.gvm/bin/gvm-init.sh" ]] && source "$HOME/.gvm/bin/gvm-init.sh"
