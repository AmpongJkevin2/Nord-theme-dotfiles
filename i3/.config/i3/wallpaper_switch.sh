#!/usr/bin/env bash

# 1. Set your folder path here
WALLPAPER_DIR="$HOME/wallpapers/nord"

# 2. Pick a random file from that folder
RANDOM_BG=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)

# 3. Apply it using feh
feh --bg-fill "$RANDOM_BG"

# 4. Optional: Send a notification
notify-send "Wallpaper Changed" "$(basename "$RANDOM_BG")"

