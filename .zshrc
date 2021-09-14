source ~/.zsh/oh-my-zsh.zsh
# don't mess with my aliases 
unalias -a
source ~/.zsh/alias.zsh

source ~/.zsh/fzf.zsh
source ~/.zsh/path.zsh
source ~/.zsh/utils.zsh
source ~/.zsh/git-alias.zsh
source ~/.zsh/misc.zsh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 
