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
