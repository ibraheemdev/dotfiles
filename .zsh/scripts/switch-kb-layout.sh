layout=$(setxkbmap -query | grep layout)

case $layout in
    *ara*)
        setxkbmap us
        ;;
    *us*)
        setxkbmap ara
esac
