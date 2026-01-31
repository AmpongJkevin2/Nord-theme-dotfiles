#!/bin/bash

# Function to find rish smarter
get_rish() {
    if [ -f "./rish" ]; then
        echo "./rish"
    elif [ -f "$HOME/rish" ]; then
        echo "$HOME/rish"
    elif command -v rish &> /dev/null; then
        echo "rish"
    else
        echo "NOT_FOUND"
    fi
}

RISH_CMD=$(get_rish)

if [ "$RISH_CMD" == "NOT_FOUND" ]; then
    echo "❌ Error: 'rish' file not found!"
    echo "Please make sure you have 'rish' in this folder or your Home folder."
    exit 1
fi

show_menu() {
    clear
    echo "========================================"
    echo "   Android 12+ Phantom Process Fixer"
    echo "   Using: $RISH_CMD"
    echo "========================================"
    echo "1. APPLY Fix (Max Limit + Persistent)"
    echo "2. REVERT to Default (Limit 32)"
    echo "3. CHECK Current Status"
    echo "4. Disable Developer Options (Optional)"
    echo "5. Exit"
    echo "========================================"
    read -p "Select an option [1-5]: " choice
}

apply_fix() {
    echo "Applying fix..."
    $RISH_CMD -c "device_config set_sync_disabled_for_tests persistent; device_config put activity_manager max_phantom_processes 2147483647"
    echo "Done! You can now run heavy scripts."
}

revert_fix() {
    echo "Reverting to Android defaults..."
    $RISH_CMD -c "device_config set_sync_disabled_for_tests none; device_config put activity_manager max_phantom_processes 32"
    echo "Done! Settings returned to stock."
}

check_status() {
    echo "--- Current Settings ---"
    echo "Max Phantom Processes (Should be 2147483647 if fixed):"
    $RISH_CMD -c "device_config get activity_manager max_phantom_processes"
    echo "------------------------"
    read -p "Press Enter to continue..."
}

disable_dev() {
    echo "Disabling Developer Options..."
    echo "WARNING: This will disconnect Shizuku immediately."
    # We use 'nohup' or just run it and expect the crash, suppressing the error
    $RISH_CMD -c "settings put global development_settings_enabled 0" 2>/dev/null
    echo "Developer Options disabled."
}

# Main Loop
while true; do
    show_menu
    case $choice in
        1) apply_fix; sleep 2 ;;
        2) revert_fix; sleep 2 ;;
        3) check_status ;;
        4) disable_dev; exit 0 ;;
        5) exit 0 ;;
        *) echo "Invalid option"; sleep 1 ;;
    esac
done
