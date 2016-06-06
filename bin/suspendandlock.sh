#!/bin/bash

#i3lock -d && dbus-send --system --print-reply \
#    --dest="org.freedesktop.UPower" \
#    /org/freedesktop/UPower \
#    org.freedesktop.UPower.Suspend

~/bin/lock.sh &
sleep 3 && systemctl suspend
