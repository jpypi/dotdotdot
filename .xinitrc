#!/bin/sh

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

twm &

urxvtd -q -o -f

## Screen powersave features
## Turn off screen after 5min
### THIS SEEMS TO BE BROKEN!
#xset +dpms
#xset dpms 0 0 300

# Reverse the trackpad scrolling
# https://n00bsys0p.wordpress.com/2011/07/26/reverse-xorg-scrolling-in-linux-natural-scrolling/
# xinput list | egrep "slave.*pointer" | grep -v XTEST | sed -e 's/^.*id=//' -e 's/\s.*$//'
# use results from expr above with: xinput get-button-map {idnum}
# Swap 4-5 to reverse vert scrolling
# Swap 6 7 to reverse horzontal scroling
xinput set-button-map bcm5974 1 2 3 5 4 7 6 8 9 10 11 12
# Set mouse acceleration. 1st is rate, 2nd is threshold above which accel is
# used. Was 2/1 4 initially
xset m 13/4 27
# Set key repeat rate
xset r rate 270 22

# Start redshift
redshift -t 6500:2600 &

## Set a desktop background
#feh --image-bg black --bg-max ~/pictures/firegitcommit-dark.png
#feh --image-bg black --bg-fill ~/pictures/Yosemite.jpg
feh --image-bg black --bg-center ~/pictures/silks/wee.png


compton -b --no-fading-openclose &

# Start i3
exec i3 #--force-xinerama -V >>~/.config/i3/i3log 2>&1
