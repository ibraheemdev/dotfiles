# start printer services
printer() {
    sudo systemctl start cups
    sudo systemctl start avahi-daemon
}

# git diff with syntax highlighting
batdiff() {
    git diff --name-only --diff-filter=d | xargs bat --diff
}

trim_quotes() {
    echo "$1" | tr -d '"'
}

sar() {
    search=$(trim_quotes $1)
    replace=$(trim_quotes $2)

    rg -l "$search" $3 | xargs sed -i "s/$search/$replace/g"
}
