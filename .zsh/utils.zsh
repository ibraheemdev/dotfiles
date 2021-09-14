# start printer services
printer() {
    sudo systemctl start cups
    sudo systemctl start avahi-daemon
}

# git diff with syntax highlighting
batdiff() {
    git diff --name-only --diff-filter=d | xargs bat --diff
}
