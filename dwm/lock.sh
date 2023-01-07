dbus-send --print-reply --dest=com.github.chjj.compton.${DISPLAY/:/_} / \
    com.github.chjj.compton.opts_set string:no_fading_openclose boolean:false

dbus-send --print-reply --dest=com.github.chjj.compton.${DISPLAY/:/_} / \
    com.github.chjj.compton.opts_set string:unredir_if_possible boolean:false

env XSECURELOCK_NO_COMPOSITE=1 XSECURELOCK_SHOW_DATETIME=1 XSECURELOCK_FONT="Iosevka Nerd Font Mono" xsecurelock

sleep 0.2
dbus-send --print-reply --dest=com.github.chjj.compton.${DISPLAY/:/_} / \
    com.github.chjj.compton.opts_set string:no_fading_openclose boolean:true
dbus-send --print-reply --dest=com.github.chjj.compton.${DISPLAY/:/_} / \
    com.github.chjj.compton.opts_set string:unredir_if_possible boolean:true

