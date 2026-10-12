export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"
DISABLE_AUTO_TITLE="true"
HIST_STAMPS="yyyy-mm-dd"

plugins=(
    git
    kubectl
    docker
    zsh-autosuggestions
    zsh-syntax-highlighting
    # aws
    # minikube
)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# User configuration
export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8
# Compilation flags
# export ARCHFLAGS="-arch x86_64"
# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Dont share the history between terminals
unsetopt share_history

eval `dircolors ~/.dir_colors/dircolors`

# Autosuggestions: use colors that can be seen..
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=60'
# zsh-syntax-highlighting
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

# Go
export GOPATH="$HOME/go"
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:$GOPATH/bin"

# Rust
export PATH="$PATH:$HOME/.cargo/bin"
export RUST_SRC_PATH=$(rustc --print sysroot)/lib/rustlib/src/rust/src

# Erlang
#. ~/erlang/24.3/activate
#export PATH="$PATH:$HOME/.cache/rebar3/bin"

# Elixir
export PATH="$PATH:$HOME/.mix/escripts"

# Java
#export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"
#export JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64"
export JAVA_HOME="/usr/lib/jvm/java-1.17.0-openjdk-amd64"

# Ruby
eval "$(~/.rbenv/bin/rbenv init - zsh)"

# Unity / mono
export FrameworkPathOverride=/usr/lib/mono/4.5/

# Krew, K8s plugin manager
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# kubebuilder autocompletion
. <(kubebuilder completion zsh)

# ccache
export PATH="$PATH:/usr/lib/ccache"

# Aliases
alias hist="history -t'%F %T'"
alias history="history -t'%F %T'"
alias ec="emacsclient -n"
alias h="history"
alias k="kubectl"
alias kc="kubectl rediscluster"
alias elvis="~/git/elvis/_build/default/bin/elvis"
alias elvis_0.4.2="~/git/elvis_0.4.2/_build/default/bin/elvis"
alias images="kubectl get pods --all-namespaces -o jsonpath=\"{.items[*].spec.containers[*].image}\" | tr \" \" \"\\n\""

alias kadmin='KUBECONFIG=$HOME/.kube/stack-admin.conf kubectl'
alias hadmin='KUBECONFIG=$HOME/.kube/stack-admin.conf helm'

# PNPM
export PNPM_HOME="/home/bjorn/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"

# Brew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
