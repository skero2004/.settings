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

# Set background
feh --bg-fill --randomize ~/bg &

# For mozc
fcitx &

# fcitx
export XMODIFIERS=@im=fcitx
export QT_IM_MODULE=fcitx
export GTK_IM_MODULE=fcitx

# Show time, battery level, and status
while true; do
	DAY=$( awk '{ print $1 " " $2 " " $3 }' <(date) )
	TIME=$( date "+%H:%M" )
	CPU=$( awk 'NR==4 { printf "%.0f", 100-$13 }' <(mpstat) )
	RAM=$( awk 'NR==2 {printf "%.0f", ($3/$2) * 100}' <(free) )
	BATT=$( acpi -b | sed 's/.*[charging|unknown|full], \([0-9]*\)%.*/\1/gi' )
	BRIGHTNESS=$( awk '{printf "%.0f", $1}' <(xbacklight -get) )
	AUDIO=$( awk -F"[][]" '/Left:/ { print $2 }' <(amixer get Master) )
	MUTE=""
	if [ `awk -F"[][]" '/Left:/ { print $4 }' <(amixer get Master)` == "off" ]; then
		MUTE=""
	fi

	xsetroot -name "  `echo $CPU`%   `echo $RAM`%   `echo $BRIGHTNESS`%  `echo $MUTE $AUDIO`   `echo $BATT`%   `echo $DAY` - `echo $TIME`"
	sleep 1
done &

# Keybindings
setxkbmap -option caps:escape

# Start dropbox sync
/usr/bin/dropbox &

# Run dwm
exec dwm
