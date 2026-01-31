# Force kill the settings daemon and session manager
pkill -9 xfconfd
pkill -9 xfce4-session

# Remove main configuration
rm -rf ~/.config/xfce4

# Remove 'autostart' (This is likely where i3 was added)
rm -rf ~/.config/autostart

# Remove session cache (This is where 'disable xfwm' is remembered)
rm -rf ~/.cache/sessions
rm -rf ~/.cache/xfce4

# Remove local data shares
rm -rf ~/.local/share/xfce4

