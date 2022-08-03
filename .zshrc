BREW_PREFIX=$(brew --prefix)

alias ":q"="exit"
alias a="php artisan"
alias c="composer"
alias dcomposed="docker-compose down"
alias dcomposeu="docker-compose up -d"
alias serve="echo 'The served URL has been opened in the background...';open -g http://127.0.0.1:8000; if [[ -f ./artisan ]]; then php artisan serve; else php -S 127.0.0.1:8000; fi"

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
