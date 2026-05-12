alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

alias ls='eza'
alias la='eza -a'
alias ll='eza -la --git'
alias tree='eza --tree'

alias cat='bat'

alias c='cargo'
alias cb='cargo build'
alias cr='cargo run'
alias cw='cargo watch'
alias ct='cargo test'

alias v="nvim"

alias cloc="tokei"
alias calc="insect"

alias wifi="nmtui"

alias g='git'
alias gs='git status'
alias gc='git commit'
alias gck='git checkout'
alias ga='git add'
alias gl='git log'
alias gaa='git add -A'
alias gp='git push'
alias gpl='git pull'
alias gd='git diff'
alias gm='git merge'
alias gca='git commit --amend'
alias gcan='git commit --amend --no-edit'

function gwip {
    git add -A;
    git commit -m "wip";
    git push;
}
