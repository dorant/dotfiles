#!/bin/bash -e

PRIMARY="eDP1"
EXT1="DP1"
EXT2="DVI-I-1-1"

PRESENTATION="HDMI1"

# Arguments:
#   toggle: toggle-once positions of screens, mirror or above
PRESENTATION_POSITION="--same-as"
EXT1_POSITION="--above"
if [ "$1" == "toggle" ]; then
    PRESENTATION_POSITION="--above"
    EXT1_POSITION="--same-as"
fi

if (xrandr | grep "$PRESENTATION connected"); then
    xrandr --output $EXT1 --off
    xrandr --output $EXT2 --off
    xrandr --output $PRIMARY --primary --auto --output $PRESENTATION $PRESENTATION_POSITION $PRIMARY
    echo "second screen (HDMI) enabled"

elif (xrandr | grep "$EXT1 connected"); then
    xrandr --output $PRESENTATION --off

    if (xrandr | grep "$EXT2 connected"); then
        xrandr --output $PRIMARY --primary --auto --output $EXT2 --auto --above $PRIMARY --output $EXT1 --auto --right-of $EXT2
        echo "second screens enabled ($EXT1,$EXT2)"
    else
        xrandr --output $PRIMARY --primary --auto --output $EXT1 --auto $EXT1_POSITION $PRIMARY
        echo "second screen enabled ($EXT1)"
    fi

else
    xrandr --output $EXT1 --off
    xrandr --output $EXT2 --off
    xrandr --output $PRESENTATION --off
    xrandr --output $PRIMARY --primary --auto
    echo "second screen(s) disabled"
fi
