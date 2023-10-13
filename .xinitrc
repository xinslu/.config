#!/bin/sh
xrandr --setprovideroutputsource modesetting NVIDIA-0
NUM=$(xrandr -q | grep -w connected | wc -l)
if [ $NUM = "2" ]
then
    xrandr --output eDP-1 --off --output HDMI-1-0 --primary --mode 2560x1440
    picom --config ~/.config/picom/picom.conf &
else
    xrandr --auto
    xrandr --dpi 96
    picom --config ~/.config/picom/picom.conf &
fi

/usr/bin/xidlehook --not-when-fullscreen --timer 180 '~/.config/scripts/lock.sh' '' &
feh --bg-fill ~/Downloads/cyberpunk.jpg &
flameshot &
dunst &
xsetroot -cursor_name left_ptr
[ -f ~/.xprofile ] && . ~/.xprofile
exec bspwm
