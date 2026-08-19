# bindings
bindkey -v
bindkey '^[[3~' delete-char # delete key

# local bin
export PATH="$HOME/bin:$PATH"

# editor
export EDITOR=nvim

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=50000
SAVEHIST=50000
setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
zshaddhistory() {
  whence ${${(z)1}[1]} >| /dev/null || return 1
}

# aliases
alias vim=nvim
alias tuvpn-split='pixi run --manifest-path $HOME/tuvpn/pixi.toml tuvpn-split'
alias tuvpn-full='pixi run --manifest-path $HOME/tuvpn/pixi.toml tuvpn-full'

# fastfetch
fastfetch

# zsh plugins
# Autosuggestions (ghost-text suggestions from history)
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# Syntax highlighting (must be sourced after autosuggestions, near-last)
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Starship prompt (must be initialized last)
eval "$(starship init zsh)"
