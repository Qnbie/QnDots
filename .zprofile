#!/bin/sh
# env vars to set on login
# zshrc => ~/config/zsh/.zshrc

# defaults
export EDITOR="nvim"
export TERM="kitty"
export TERMINAL="kitty"
export BROWSER="librewolf"

# XDG base dir struct
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# bootstrap .zshrc to ~/.config/zsh/.zshrc
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# add scripts to path
export PATH="$XDG_CONFIG_HOME/scripts:$PATH"

# additional env vars for various programs
export GOPATH="$XDG_DATA_HOME/go"
export GOBIN="$GOPATH/bin"
export GOMODCACHE="$XDG_CACHE_HOME/go/mod"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"


export FZF_DEFAULT_OPTS="--style minimal --color 16 --layout=reverse --height 30% --preview='bat -p --color=always {}'"
export FZF_CTRL_R_OPTS="--style minimal --color 16 --info inline --no-sort --no-preview" # separate opts for history widget
export MANPAGER="less -R --use-color -Dd+r -Du+b" # colored man pages


