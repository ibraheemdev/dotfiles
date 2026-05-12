source ~/.zsh/oh-my-zsh.zsh
unalias -a

source ~/.zsh/local.zsh
source ~/.zsh/alias.zsh
source ~/.zsh/git-alias.zsh
source ~/.zsh/path.zsh
source ~/.zsh/utils.zsh

bindkey -v

if [[ "$(uname)" == "Linux" ]]; then
    source ~/.zsh/linux.zsh
fi
