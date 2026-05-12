sar() {
    search=$1
    replace=$2

    rg -l -F "$search" $3 | xargs sed -i "s|$search|$replace|g"
}
