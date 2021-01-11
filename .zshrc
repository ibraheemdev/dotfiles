# dotfiles repo
alias dotfiles='git --git-dir=/home/ibraheem/.dotfiles/ --work-tree=/home/ibraheem'

# theme
ZSH_THEME="robbyrussell"

# plugins
plugins=(git)

# initialize oh my zsh
export ZSH="/home/ibraheem/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# aliases
alias ls='exa'
alias la='exa -a'
alias ll='exa -l --git'
alias lll='exa -la --git'
alias tree='exa --tree'
alias cat='bat'
alias c='cargo'
alias g='git'
alias gs='git status'
alias ga='git add -A'
alias gp='git push'
alias gd='git diff'
alias gm='git merge'
alias grh='git reset --hard'
alias gca='git commit --amend'

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
