eval "$(/opt/homebrew/bin/brew shellenv)"

source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source $(brew --prefix)/Cellar/fzf/**/shellcompletion.zsh
# source $(brew --prefix)/Cellar/fzf/**/shell/key-bindings.zsh
#M1 ^
# eval "$(/usr/local/Homebrew/bin/brew shellenv)"
#intel ^
eval "$(fzf --zsh)"