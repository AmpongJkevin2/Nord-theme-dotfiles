#!/data/data/com.termux/files/usr/bin/bash

# 1. Set your wallpaper folder (Change this path if needed!)
WALLPAPER_DIR="$HOME/wallpapers/nord"

# 2. Pick a random file from that directory
# We use 'ls' and 'sort -R' (random) to pick one file
RANDOM_BG=$(ls "$WALLPAPER_DIR" | sort -R | head -1)

# 3. Tell Sway to change the background immediately
# We use 'swaymsg' instead of 'feh'
swaymsg output "*" bg "$WALLPAPER_DIR/$RANDOM_BG" fill

