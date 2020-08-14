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

eval `dircolors ~/.dir_colors`

# Autosuggestions: use colors that can be seen..
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=60'
# zsh-syntax-highlighting
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

# Go
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

# Rust
export PATH="$PATH:$HOME/.cargo/bin"
export RUST_SRC_PATH=$(rustc --print sysroot)/lib/rustlib/src/rust/src

# Erlang
. ~/erlang/22.1/activate

# Aliases
alias hist="history -t'%F %T'"
alias history="history -t'%F %T'"
alias ec="emacsclient -n"
alias h="history"
alias k="kubectl"
alias images="kubectl get pods --all-namespaces -o jsonpath=\"{.items[*].spec.containers[*].image}\" | tr \" \" \"\\n\""
