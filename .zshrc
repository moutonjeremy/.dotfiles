# General configuration

# Colors.
unset LSCOLORS
export CLICOLOR=1
export CLICOLOR_FORCE=1

# Don't require escaping globbing characters in zsh.
unsetopt nomatch

zstyle ':vcs_info:git:*' formats '%b '

setopt PROMPT_SUBST
PROMPT='%F{green}%*%f %F{blue}%~%f %F{red}${vcs_info_msg_0_}%f$ '

# Path export
export PATH=$HOME/bin:/usr/local/bin:/opt/homebrew/bin/:$PATH

# Set plugins list
plugins=(aws terraform brew git kubectl history-substring-search)

# User configuration

export HOMEBREW_AUTO_UPDATE_SECS=604800

# golang configuration
export GOPATH=$HOME/development/golang
export GOSUMDB=off

# iterm2 configuration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

autoload -U +X bashcompinit && bashcompinit