#!/bin/bash
connectedOutputs=$(xrandr | grep " connected" | sed -e "s/\([A-Z0-9]\+\) connected.*/\1/")
i=1
for display in $connectedOutputs
do
    if [ "$i" =  "1" ]
    then
        echo " $i  /  $display"
        xrandr --auto
        xrandr --output $display --primary
        intern=$display
    fi
    if [ "$i" =  "2" ]
    then
        echo " $i  /  $display"
        xrandr --output $display --auto --right-of $intern
    fi
    
    i=$((i + 1))
done

# If lid is closed, turn of the screen. cat /proc/acpi/button/lid/LID0/state |grep closed
closed=$(grep closed /proc/acpi/button/lid/LID0/state)
if [ $? -eq 0 ]
then
    xrandr --output $display --primary --output $intern --off
fi

#feh --bg-scale ~/.config/i3/wallpaper_family.jpg
feh --bg-fill ~/.config/i3/wallpaper_family.jpg

# intern=eDP1
# extern=HDMI1
# str="$(xrandr | grep "$extern disconnected")"

# xrandr --auto
# xrandr --output $intern --primary

# if [ "$str" = "" ]; then
#    echo "Connected"
#    xrandr --output $extern --auto --right-of $intern
# fi
