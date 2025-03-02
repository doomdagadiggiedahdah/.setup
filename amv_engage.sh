#!/bin/bash

# Status file to track background window
STATUS_FILE="$HOME/.background_window"

# Toggle function
toggle_background_window() {
    # Check if a background window is already set
    if [ -f "$STATUS_FILE" ]; then
        # Read the window ID and clear its background status
        BG_WINDOW_ID=$(cat "$STATUS_FILE")
        wmctrl -i -r "$BG_WINDOW_ID" -b remove,below,sticky
        rm "$STATUS_FILE"
        notify-send "Background Mode Off" "Windows will behave normally again"
    else
        # Get current window and set it as background
        CURRENT_WIN=$(xdotool getactivewindow)
        
        # Set window to be "below" others and sticky (visible on all workspaces)
        wmctrl -i -r "$CURRENT_WIN" -b add,below,sticky
        
        # Save window ID
        echo "$CURRENT_WIN" > "$STATUS_FILE"
        
        # Ensure other windows appear translucent when focused
        # This requires your existing transparency plugin/setup
        notify-send "Background Mode On" "Current window set as permanent background"
    fi
}

# Just run the toggle function directly - no command line options needed
toggle_background_window
