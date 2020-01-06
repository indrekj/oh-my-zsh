# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="mine"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git fzf asdf)

source $ZSH/oh-my-zsh.sh

# User configuration
#
# Note that some configuration is also in custom/* dir

# Use vim as the default editor
export EDITOR='vim'

# Use more cores when compiling something
export MAKEFLAGS="-j8"

bindkey -e
bindkey '\M-d' backward-kill-word
bindkey '\e[1;9D' backward-word
bindkey '\e[1;9C' forward-word
bindkey '\e[1;10D' beginning-of-line
bindkey '\e[1;10C' end-of-line
bindkey '' backward-kill-word # ctrl-backspace

# In menu completion, the Return key will accept the current selected match
bindkey -M menuselect '^M' .accept-line

# Add local sbin to path
export PATH="$PATH:/usr/local/sbin"

# Add Glia binaries to the path
export PATH="$HOME/salemove/sm-configuration/bin:$PATH"

# Add relative node modules bin dir to the path
export PATH="./node_modules/.bin:$PATH"

# Golang configuration
export GOPATH=$HOME/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin:/usr/local/opt/go/libexec/bin

# Erlang configuration
export ERL_AFLAGS="-kernel shell_history enabled"

# No spelling correction for these commands
alias vim='nocorrect nvim'

# find normally doesn't need globbing but it does use wildcards, this makes:
# find -name *asd* work like find -name '*asd*'
alias find='noglob find'

# Do not share command history data
unsetopt share_history

# Local machine-specific and private configuration if exists
[ -e ~/.zshrc.private ] && source ~/.zshrc.private
