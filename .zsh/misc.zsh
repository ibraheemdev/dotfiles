export EDITOR=nvim;
set RANGER_LOAD_DEFAULT_RC=FALSE
set XDG_DOWNLOAD_DIR="~/downloads"

eval `keychain --eval --quiet --agents ssh id_ed25519`

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
