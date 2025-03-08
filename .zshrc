#!/bin/bash

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
# export ZSH="~/.oh-my-zsh"

ZSH_THEME="joe2"
# ZSH_THEME="gnzh"
# ZSH_THEME="kphoen"

DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(git zsh-autosuggestions zsh-interactive-cd)
# plugins=(git fzf-tab zsh-autosuggestions)
# bindkey '^I' fzf_completion

source ~/.oh-my-zsh/oh-my-zsh.sh
# source ~/.oh-my-zsh/custom/plugins/fzf-tab-completion/zsh/fzf-zsh-completion.sh
# source ~/.oh-my-zsh/custom/zsh-syntax-highlighting/themes/catppuccin_latte-zsh-syntax-highlighting.zsh
# source ~/.oh-my-zsh/custom/zsh-syntax-highlighting/themes/catppuccin_frappe-zsh-syntax-highlighting.zsh
# source ~/.oh-my-zsh/custom/scripts/fzf-git.sh

  # source ~/.oh-my-zsh/custom/plugins/fzf-tab-completion/zsh/fzf-zsh-completion.sh
  # bindkey '^I' fzf_completion
  # these two were needed on intel mbp

# source "/opt/homebrew/opt/fzf/shell/completion.zsh"
source "/opt/homebrew/opt/fzf/shell/key-bindings.zsh"
source ~/.zsh_env
source ~/.zsh_aliases
source ~/.zsh_functions
if [ -f ~/.functions ]
  then source ~/.functions
fi
if [ -f ~/.aliases ]
  then source ~/.aliases
fi
if [ -d ~/.zsh_local ]; then ; for i in ~/.zsh_local/.local*; do source $i; done ; fi
if [ -d ~/.zsh_optional ]; then ; for i in ~/.zsh_optional/.*; do source $i; done ; fi

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='micro'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/P3193379/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

# Print tree structure in the preview window
export FZF_ALT_C_OPTS="--preview 'tree -C {}'"

# Preview file content using bat (https://github.com/sharkdp/bat)
export FZF_CTRL_T_OPTS="
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"

# CTRL-/ to toggle small preview window to see the full command
# CTRL-Y to copy the command into clipboard using pbcopy
export FZF_CTRL_R_OPTS="
  --preview 'echo {}' --preview-window up:3:hidden:wrap
  --bind 'ctrl-/:toggle-preview'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"
