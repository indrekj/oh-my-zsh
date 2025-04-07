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
export MAKEFLAGS="-j12"

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

# Add relative node modules bin dir to the path
export PATH="./node_modules/.bin:$PATH"

# Add user bin dir to the path
export PATH="$PATH:$HOME/bin"
export PATH="$HOME/.local/bin:$PATH"

# Golang configuration
export GOPATH=$HOME/go
export GOROOT=/usr/local/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

# Add Glia binaries to the path
export PATH="$HOME/salemove/sm-configuration/bin:$PATH"

# Erlang configuration
export ERL_AFLAGS="-kernel shell_history enabled"

# No spelling correction for these commands
alias vim='nocorrect nvim'

# find normally doesn't need globbing but it does use wildcards, this makes:
# find -name *asd* work like find -name '*asd*'
alias find='noglob find'

# Immediately write to the history but don't re-read it.
unsetopt share_history
setopt inc_append_history

# Linux specific settings
if command apt 2> /dev/null; then
  export AWS_OKTA_BACKEND=secret-service

  # Completion for kitty
  kitty + complete setup zsh | source /dev/stdin

  # To make docker-compose work with Glia
  # sudo chown indrek:indrek /run/host-services
  # ln -s $SSH_AUTH_SOCK /run/host-services/ssh-auth.sock
fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

irt() {
  invoker reload "$1" && invoker tail "$1"
}

export OTEL_PROPAGATORS="b3multi"
export OTEL_TRACES_EXPORTER="otlp"
export OTEL_EXPORTER_OTLP_TRACES_ENDPOINT="http://localhost:4318/v1/traces"
export OTEL_TRACES_SAMPLER="parentbased_always_off"

export NS_NAME=indrek

# Local machine-specific and private configuration if exists
[ -e ~/.zshrc.private ] && source ~/.zshrc.private
