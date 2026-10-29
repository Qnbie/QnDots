# interactive zsh config

# aliases
[ -f "$ZDOTDIR/alias" ] && source "$ZDOTDIR/alias"

# modules
zmodload zsh/complist
autoload -Uz compinit
mkdir -p "$XDG_CACHE_HOME/zsh"
compinit -d "$XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION"

autoload -Uz colors && colors

# completion
zstyle ':completion:*' menu select
zstyle ':completion:*' special-dirs true
[[ -n "$LS_COLORS" ]] && zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' file-list true
zstyle ':completion:*' squeeze-slashes false
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # case-insensitive matching
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/zcompcache"
mkdir -p "$XDG_CACHE_HOME/zsh/zcompcache"

# history
HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE="$XDG_STATE_HOME/zsh/history"
mkdir -p "${HISTFILE:h}"
setopt append_history inc_append_history share_history
setopt hist_ignore_dups hist_ignore_space hist_reduce_blanks hist_find_no_dups

# options
setopt auto_menu menu_complete
setopt extended_glob
setopt no_case_glob no_case_match
setopt interactive_comments
setopt no_beep
unsetopt prompt_sp

# globbing: dotfiles are opt-in per pattern, e.g. `ls *(D)`.
# No global `globdots`, so `rm *`, `git add *` and `**/*` stay safe.

# keybindings (emacs mode)
bindkey -e
# up/down: prefix search through history (fish-like)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward
bindkey '^[OA' history-search-backward
bindkey '^[OB' history-search-forward
# Alt+arrows: word movement
bindkey '^[[1;3D' backward-word
bindkey '^[[1;3C' forward-word

# fzf -- loads its own ^R/^T/^C widgets
if [[ -t 0 ]] && command -v fzf >/dev/null 2>&1; then
  source <(fzf --zsh)
fi

# prompt
if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi
