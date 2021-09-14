#!ruby
layout = `setxkbmap -query | grep layout`

case layout
when /ara/
    exec %q[
        setxkbmap us
        xmodmap -e "clear Lock"
        xmodmap -e "keycode 9 = Caps_Lock"
        xmodmap -e "keycode 66 = Escape"
        xmodmap -e "add Lock = Caps_Lock"
    ]
when /us/
    exec "setxkbmap ara"
end
