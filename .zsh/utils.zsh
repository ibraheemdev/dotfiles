# start printer services
printer() {
    sudo systemctl start cups
    sudo systemctl start avahi-daemon
}

# git diff with syntax highlighting
batdiff() {
    git diff --name-only --diff-filter=d | xargs bat --diff
}

sar() {
    search=$1
    replace=$2

    rg -l -F "$search" $3 | xargs sed -i "s|$search|$replace|g"
}
