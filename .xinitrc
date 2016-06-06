#!/bin/sh
#xrandr --setprovideroutputsource modesetting NVIDIA-0
#xrandr --auto
userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

#twm &
#xclock -geometry 50x50-1+1 &
#xterm -geometry 80x50+494+51 &
#xterm -geometry 80x20+494-0 &
#exec xterm -geometry 80x66+0+0 -name login
setxkbmap -option ctrl:nocaps
xset r rate 200 50
#xrandr --dpi 192

# Enable touchpad tapping
#xinput set-prop "DLL06E4:01 06CB:7A13 Touchpad" 275 1

# Enable two-finger and three-finger clicks
xinput set-prop "DLL06E4:01 06CB:7A13 Touchpad" "libinput Click Method Enabled" 0 1

# Change accell to 1
xinput set-prop "DLL06E4:01 06CB:7A13 Touchpad" 281 1

# Enable natural scrolling
xinput set-prop "DLL06E4:01 06CB:7A13 Touchpad" 283 1
exec i3
