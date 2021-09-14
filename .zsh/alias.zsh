# dotfiles repo
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

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

# ripgrep: a faster grep that respects .gitignore
alias grep='rg'

# vim
alias v='nvim'
alias vimrc='v ~/.config/nvim/init.vim'
alias zshrc='v ~/.zshrc'

# tokei: count lines of code, fast
alias cloc="tokei"
alias calc="insect"

alias find="fd"
