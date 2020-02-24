#!/bin/bash -e

# Screen devices
LAPTOP="eDP-1" # Intel
# LAPTOP="eDP-1-1" # Nvidia
HDMI="DP-3"
USBC="DP-1-1"

# Which device to use
PRIMARY=$LAPTOP
EXTRA=$HDMI
PRESENTATION=$USBC

# Configs
PRESENTATION_SIZE="1920x1080"

# Arguments:
#   mirror: toggle-once positions of screens, mirror or above
PRESENTATION_POSITION="--above"
EXTRA_POSITION="--above"
EXTRA_SIZE="--auto"
if [ "$1" == "mirror" ]; then
    notify-send -u low "Screen mirror"
    PRESENTATION_POSITION="--same-as"
    EXTRA_POSITION="--same-as"
    EXTRA_SIZE="--mode 1920x1080"
fi

if (xrandr | grep "$PRESENTATION connected"); then
    xrandr --output $EXTRA --off
    xrandr --output $PRESENTATION --auto
    xrandr --output $PRIMARY --primary --auto --output $PRESENTATION --mode $PRESENTATION_SIZE $PRESENTATION_POSITION $PRIMARY
    notify-send -u low "presentation screen enabled ($PRESENTATION)"

elif (xrandr | grep "$EXTRA connected"); then
    xrandr --output $PRESENTATION --off
    xrandr --output $PRIMARY --primary --auto --output $EXTRA $EXTRA_SIZE $EXTRA_POSITION $PRIMARY
    notify-send -u low "second screen enabled ($EXTRA)"
    # xrandr --output $PRIMARY --primary --auto --output $USBC --auto --above $PRIMARY --output $HDMI --auto --right-of $USBC

else
    # Only use laptop screen
    if [[ $(xrandr | grep "$PRIMARY connected") = "" ]]; then
       echo "Error! Primary screen not found: $PRIMARY"
    fi
    xrandr --output $EXTRA --off
    xrandr --output $PRESENTATION --off
    xrandr --output $PRIMARY --primary --auto
    notify-send -u low "second screen(s) disabled"
fi
