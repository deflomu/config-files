## smart urls
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

## file rename magick
bindkey "^[m" copy-prev-shell-word

## jobs
setopt long_list_jobs

## pager
export PAGER="less -R"
export LC_CTYPE=$LANG

## editor
export EDITOR="vim"

## Disable mail check
MAILCHECK=0
