#!/bin/bash
sleep 5
MOUSE="/sys/bus/usb/devices/1-1.2/power/control"
if [ -f "$MOUSE" ]; then
    echo 'on' > $MOUSE
fi

KEYBOARD="/sys/bus/usb/devices/1-1.1/power/control"
if [ -f "$KEYBOARD" ]; then
    echo 'on' > $KEYBOARD
fi
