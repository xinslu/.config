#!/bin/bash
TMPBG=/tmp/screen.png
scrot ~/.config/i3/lock.png
convert $TMPBG -blur 0x5 $TMPBG
i3lock -u -i $TMPBG
