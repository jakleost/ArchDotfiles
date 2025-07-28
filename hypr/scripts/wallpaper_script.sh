#!/bin/bash

WALLPAPERS="$HOME/Pictures/Wallpapers"
# Delay between switches (in seconds)
INTERVAL=120
# Transition effect
TRANSITION="any"  
DURATION=1.0      

# Start the swww daemon if not already running
pgrep -x swww-daemon > /dev/null || swww-daemon &

# Infinite loop to switch wallpapers
while true; do
    # Pick a random wallpaper
    FILE=$(find "$WALLPAPERS" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" \) | shuf -n 1)
    
    # Set the wallpaper with a transition
    swww img "$FILE" --transition-type "$TRANSITION" --transition-duration "$DURATION"

    # Wait for the interval
    sleep "$INTERVAL"
done

