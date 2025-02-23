#!/bin/bash
# Get the current layout
current_layout=$(setxkbmap -query | awk '/layout/ {print $2}')

# Toggle between English (us) and Persian (fa)
if [ "$current_layout" = "us" ]; then
    setxkbmap ir
else
    setxkbmap us
fi

