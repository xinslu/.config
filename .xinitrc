#!/bin/sh
# xrandr --setprovideroutputsource modesetting NVIDIA-0
NUM=$(xrandr -q | grep -w connected | wc -l)
if [ $NUM = "2" ]
then
    xrandr --output eDP-1-1 --off --output HDMI-0 --primary --mode 2560x1440
    echo "here"
else
    xrandr --auto
    xrandr --dpi 96
fi

/usr/bin/xidlehook --not-when-fullscreen --timer 180 '~/.config/scripts/lock.sh' '' &
picom --config ~/.config/picom/picom.conf --experimental-backend &
feh --bg-fill ~/Downloads/bladerunner.jpg &
flameshot &
dunst &
xsetroot -cursor_name left_ptr
[ -f ~/.xprofile ] && . ~/.xprofile
exec bspwm
