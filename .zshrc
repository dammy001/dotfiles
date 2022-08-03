BREW_PREFIX=$(brew --prefix)

# mkdir + cd
function take() {
  mkdir -p $@ && cd ${@:$#}
}

# Use Dracula for the syntax highlighting theme
export BAT_THEME="Dracula"

# Zsh syntax highlighting
# https://github.com/zsh-users/zsh-syntax-highlighting
source "${BREW_PREFIX}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"


# Brew autocompletions
# https://docs.brew.sh/Shell-Completion
export FPATH="${BREW_PREFIX}/share/zsh/site-functions:${FPATH}"
autoload -Uz compinit
compinit
