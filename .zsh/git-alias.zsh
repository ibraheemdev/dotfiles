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
alias -s git="git clone"

function gwip {
    git add -A;
    git commit -m "wip";
    git push;
}
