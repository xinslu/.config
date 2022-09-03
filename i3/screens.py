#!/usr/bin/env python3
import subprocess
import time
# --- set your internal screen below (the example is my primary screen)
internal = "eDP"
#---

# don't change anything below
scr_info1 = 0

while True:
    time.sleep(4)
    # read the current screen setup from xrandr
    get_screens = subprocess.check_output("xrandr").decode("utf-8").splitlines()
    scr_data = [l for l in get_screens if " connected " in l]
    # count the number of connected screens
    scr_info2  = len(scr_data)
    # if the number of connected screens changes, 
    # switch off the internal one if there are two screens
    if scr_info2 != scr_info1:
        if scr_info2 == 2:
            ext = [s.split()[0] for s in scr_data if not internal in s][0]
            subprocess.Popen(["xrandr", "--output", internal, "--off", "--output", ext, "--primary", "--mode", "2560x1440","--pos", "0x0", "--rotate", "normal"])
        if scr_info2 == 1:
            subprocess.Popen(["xrandr", "--output", internal, "--auto"])
    scr_info1 = scr_info2
