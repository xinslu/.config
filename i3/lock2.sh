#!/bin/sh
TMPBG=/usr/share/sddm/themes/sddm-astronaut-theme/Backgrounds/background2.png
dbus-send --print-reply --dest=com.github.chjj.compton.${DISPLAY/:/_} / \
    com.github.chjj.compton.opts_set string:no_fading_openclose boolean:false

dbus-send --print-reply --dest=com.github.chjj.compton.${DISPLAY/:/_} / \
    com.github.chjj.compton.opts_set string:unredir_if_possible boolean:false

i3lock \
  --color=000000\
  --time-pos="x+90:y+1320" \
  --date-pos="tx+24:ty+25" \
  --clock --date-str "Type password to unlock..." \
  --inside-color=00000000 --ring-color=ffffffff --line-uses-inside \
  --keyhl-color=d23c3dff --bshl-color=d23c3dff --separator-color=00000000 \
  --insidever-color=fecf4dff --insidewrong-color=d23c3dff \
  --ringver-color=ffffffff --ringwrong-color=ffffffff --ind-pos="x+290:h-120" \
  --radius=20 --ring-width=3 --verif-text="" --wrong-text="" \
  --layout-color="ffffffff" --time-color="ffffffff" --date-color="ffffffff"

sleep 0.2
dbus-send --print-reply --dest=com.github.chjj.compton.${DISPLAY/:/_} / \
    com.github.chjj.compton.opts_set string:no_fading_openclose boolean:true
dbus-send --print-reply --dest=com.github.chjj.compton.${DISPLAY/:/_} / \
    com.github.chjj.compton.opts_set string:unredir_if_possible boolean:true
