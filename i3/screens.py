#!/usr/bin/env python3
import subprocess
import time
internal = "eDP-1-1"

scr_info1 = 0

while True:
    time.sleep(2)
    get_screens = subprocess.check_output("xrandr").decode("utf-8").splitlines()
    scr_data = [l for l in get_screens if " connected " in l]
    scr_info2  = len(scr_data)
    if scr_info2 != scr_info1:
        if scr_info2 == 2:
            ext = [s.split()[0] for s in scr_data if not internal in s][0]
            subprocess.Popen(["xrandr", "--output", internal, "--off", "--output", ext, "--primary", "--mode", "2560x1440","--pos", "0x0", "--rotate", "normal"])
            subprocess.Popen(["bash", "~/.config/polybar/docky/launch.sh"])
        if scr_info2 == 1:
            subprocess.Popen(["xrandr", "--output", internal, "--auto"])
            subprocess.Popen(["bash", "~/.config/polybar/docky/launch.sh"])
    scr_info1 = scr_info2
