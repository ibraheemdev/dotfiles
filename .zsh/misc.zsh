export EDITOR=nvim;
set RANGER_LOAD_DEFAULT_RC=FALSE
set XDG_DOWNLOAD_DIR="~/downloads"

eval `keychain --eval --quiet --agents ssh id_ed25519`

alias myip="ip -json route get 8.8.8.8 | jq -r '.[].prefsrc'"
