#!/bin/bash
# Get the current volume percentage (using pactl to query the default sink)
current_volume=$(pactl list sinks | awk '/Volume: front/{print $5}' | sed 's/%//')

# Define a list of volume levels (customize as you like)
volumes=$(echo -e "0\n10\n20\n30\n40\n50\n60\n70\n80\n90\n100")

# Use dmenu to let the user select a volume (current volume is displayed in the prompt)
new_volume=$(echo "$volumes" | dmenu -p "Volume (current ${current_volume}%):")

# If a selection was made, set the volume
if [ -n "$new_volume" ]; then
    pactl set-sink-volume @DEFAULT_SINK@ ${new_volume}%
fi

