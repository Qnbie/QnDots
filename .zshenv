# ~/.zshenv -- read by EVERY zsh invocation (login, interactive, scripts).
# Keep this file fast and side-effect free.

# XDG base dirs
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"

# where zsh looks for .zshrc / .zprofile / .zlogin
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# default programs
export EDITOR="nvim"
export VISUAL="nvim"
export PAGER="less"
export MANPAGER="less -R --use-color -Dd+r -Du+b"
export BROWSER="librewolf"
export TERMINAL="kitty"

# user binaries
export PATH="$HOME/.local/bin:$PATH"

# Go
export GOPATH="$XDG_DATA_HOME/go"
export GOBIN="$GOPATH/bin"
export GOMODCACHE="$XDG_CACHE_HOME/go/mod"

# fzf
export FZF_DEFAULT_OPTS="--style minimal --color 16 --layout=reverse --height 30% --preview='bat -p --color=always {}'"
export FZF_CTRL_R_OPTS="--style minimal --color 16 --info inline --no-sort --no-preview"
