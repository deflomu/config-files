export ZSH=~/.zsh

# Load all of the config files in ~/oh-my-zsh that end in .zsh
for config_file ($ZSH/lib/*.zsh) source $config_file

export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# Load and run compinit
autoload -U compinit
compinit -i
