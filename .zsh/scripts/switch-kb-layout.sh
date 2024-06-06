layout=$(setxkbmap -query | grep layout)

case $layout in
    *ara*)
        setxkbmap us
        xmodmap -e "clear Lock"
        xmodmap -e "keycode 9 = Caps_Lock"
        xmodmap -e "keycode 66 = Escape"
        xmodmap -e "add Lock = Caps_Lock"
        ;;
    *us*)
        setxkbmap ara
esac
