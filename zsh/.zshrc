# bindings
bindkey -v
bindkey '^[[3~' delete-char # delete key
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line

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

# Gurobi
export GUROBI_HOME="$(echo $HOME/gurobi/gurobi*/linux64 | tr ' ' '\n' | sort -V | tail -1)"
if [ -d "$GUROBI_HOME" ]; then
    export PATH="$PATH:$GUROBI_HOME/bin"
    export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$GUROBI_HOME/lib"
fi

# zsh plugins
# Autosuggestions (ghost-text suggestions from history)
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# Syntax highlighting (must be sourced after autosuggestions, near-last)
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Starship prompt (must be initialized last)
eval "$(starship init zsh)"
