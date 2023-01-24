#!/bin/sh
xrandr --setprovideroutputsource modesetting NVIDIA-0
NUM=$(xrandr -q | grep -w connected | wc -l)
if [ $NUM = "2" ] 
then
    xrandr --output eDP-1-1 --off --output HDMI-0 --primary --mode 2560x1440
else
    xrandr --auto
    xrandr --dpi 96
fi

/usr/bin/xidlehook --not-when-fullscreen --timer 180 '~/.config/bspwm/lock.sh' '' &
picom --config ~/.config/picom/picom.conf --backend glx &
feh --bg-fill ~/Downloads/spaceman-bg.jpg &
flameshot &
dunst &
xsetroot -cursor_name left_ptr 
# dwmblocks &
exec bspwm
