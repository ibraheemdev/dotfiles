# dotfiles repo
alias dotfiles='git --git-dir=/home/ibraheem/.dotfiles/ --work-tree=/home/ibraheem'

# theme
ZSH_THEME="robbyrussell"

# plugins
plugins=(git)

# initialize oh my zsh
export ZSH="/home/ibraheem/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

alias ls='exa'
alias la='exa -a'
alias ll='exa --long --git'
alias tree='exa --tree'
alias cat='bat'

# cargo bin
export PATH="$HOME/.cargo/bin:$PATH"

# dotnet tools
export PATH="$PATH:/home/ibraheem/.dotnet/tools"

# fzf
export FZF_DEFAULT_COMMAND='fd --type f'

print-service() {
    sudo systemctl start cups
    sudo systemctl start avahi-daemon
}

# start docker daemon
docker-service() {
    sudo systemctl start docker.service
}

# git diff with syntax highlighting
batdiff() {
    git diff --name-only --diff-filter=d | xargs bat --diff
}
