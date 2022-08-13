#!/bin/sh

TMPBG=/tmp/screen.png
# Enable compton's fade-in effect so that the lockscreen gets a nice fade-in
# effect.
dbus-send --print-reply --dest=com.github.chjj.compton.${DISPLAY/:/_} / \
    com.github.chjj.compton.opts_set string:no_fading_openclose boolean:false

# If disable unredir_if_possible is enabled in compton's config, we may need to
# disable that to avoid flickering. YMMV. To try that, uncomment the following
# two lines and the last two lines in this script.
# dbus-send --print-reply --dest=com.github.chjj.compton.${DISPLAY/:/_} / \
#     com.github.chjj.compton.opts_set string:unredir_if_possible boolean:false

# Suspend dunst and lock, then resume dunst when unlocked.
i3lock \
  -i $TMPBG \
  --time-pos="x+90:y+960" \
  --date-pos="tx+24:ty+25" \
  --clock --date-str "Type password to unlock..." \
  --inside-color=00000000 --ring-color=ffffffff --line-uses-inside \
  --keyhl-color=d23c3dff --bshl-color=d23c3dff --separator-color=00000000 \
  --insidever-color=fecf4dff --insidewrong-color=d23c3dff \
  --ringver-color=ffffffff --ringwrong-color=ffffffff --ind-pos="x+290:h-120" \
  --radius=20 --ring-width=3 --verif-text="" --wrong-text="" \
  --layout-color="ffffffff" --time-color="ffffffff" --date-color="ffffffff"

# Revert compton's config changes.
sleep 0.2
dbus-send --print-reply --dest=com.github.chjj.compton.${DISPLAY/:/_} / \
    com.github.chjj.compton.opts_set string:no_fading_openclose boolean:true
# dbus-send --print-reply --dest=com.github.chjj.compton.${DISPLAY/:/_} / \
#     com.github.chjj.compton.opts_set string:unredir_if_possible boolean:true
