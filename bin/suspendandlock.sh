#!/bin/bash

#i3lock -d && dbus-send --system --print-reply \
#    --dest="org.freedesktop.UPower" \
#    /org/freedesktop/UPower \
#    org.freedesktop.UPower.Suspend

i3lock -d && systemctl suspend
