~/.config/bspwm/screens.py &
xautolock -time 5 -locker '~/.config/bspwm/lock.sh' &
picom --config ~/.config/picom/picom.conf --backend glx &
feh --bg-fill ~/Downloads/spaceman-bg.jpg &
exec bspwm
