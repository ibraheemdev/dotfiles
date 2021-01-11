# dotfiles repo
alias dotfiles='git --git-dir=~/.dotfiles/ --work-tree=~'

# exa: a modern replacement for ‘ls’.
alias ls='exa'
alias la='exa -a'
alias ll='exa -l --git'
alias lll='exa -la --git'
alias tree='exa --tree'

# bat: a cat clone with wings. 
alias cat='bat'

# cargo
alias c='cargo'
alias cb='cargo build'
alias cr='cargo run'
alias cw='cargo watch'
alias ct='cargo test'
