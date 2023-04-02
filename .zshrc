# General configuration

# Colors.
unset LSCOLORS
export CLICOLOR=1
export CLICOLOR_FORCE=1

# Don't require escaping globbing characters in zsh.
unsetopt nomatch

autoload -Uz compinit
compinit

zstyle ':vcs_info:git:*' formats '%b '

setopt PROMPT_SUBST
PROMPT=$'
%F{green}%n@%m%f %F{blue}[%*]%f [%~] %F{red}${vcs_info_msg_0_}%f\
%F{blue}-> % %f'

# Path export
export PATH=$HOME/bin:/usr/local/bin:/opt/homebrew/bin/:$PATH

# Set plugins list
source $HOME/.config/github/dotfiles/zsh_plugins/aws.plugin.zsh
# source $HOME/.config/github/dotfiles/zsh_plugins/terraform.plugin.zsh
# source $HOME/.config/github/dotfiles/zsh_plugins/brew.plugin.zsh
# source $HOME/.config/github/dotfiles/zsh_plugins/kubectl.plugin.zsh
# source $HOME/.config/github/dotfiles/zsh_plugins/kubectx.plugin.zsh
# source $HOME/.config/github/dotfiles/zsh_plugins/git.plugin.zsh
plugins=(aws)

# User configuration

export HOMEBREW_AUTO_UPDATE_SECS=604800

# golang configuration
export GOPATH=$HOME/development/golang
export GOSUMDB=off

# iterm2 configuration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Aliases
alias ll='ls -lah'

autoload -U +X bashcompinit && bashcompinit