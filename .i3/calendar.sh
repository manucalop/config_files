#!/bin/bash
unset winid
zenity --calendar & 
while [ ${#winid} -le 10 ] 
do
    winid=$(xdotool search --class Zenity)
done
winid=${winid: -8:8}
#eval $(xdotool getdisplaygeometry --shell)
eval $(xdotool getmouselocation --shell)
#pos=$((WIDTH-265))
xdotool windowmove $winid $((X-250)) $((Y+50))
