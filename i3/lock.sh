#!/bin/bash
TMPBG=/tmp/screen.png
scrot /tmp/screen.png
convert $TMPBG -blur 0x5 $TMPBG
i3lock -u -i $TMPBG
