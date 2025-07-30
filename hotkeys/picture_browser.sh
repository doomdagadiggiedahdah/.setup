#!/bin/bash

# Picture browser script with rofi menu
PICTURES_DIR="/home/mat/Pictures/onePlis_Camera/Camera"

# Check if pictures directory exists
if [ ! -d "$PICTURES_DIR" ]; then
    notify-send "Error" "Pictures directory not found: $PICTURES_DIR"
    exit 1
fi

# Get current date in YYYY-MM-DD format
TODAY=$(date +%Y-%m-%d)
THREE_DAYS_AGO=$(date -d '3 days ago' +%Y-%m-%d)
WEEK_AGO=$(date -d '1 week ago' +%Y-%m-%d)
MONTH_AGO=$(date -d '1 month ago' +%Y-%m-%d)

# Rofi menu options
CHOICE=$(echo -e "Today\nLast 3 days\nLast week\nLast month" | rofi -dmenu -p "Show pictures from:")

# Function to open pictures directory with time filter
open_pictures() {
    local time_filter="$1"
    local label="$2"
    
    # Find the most recent directory with pictures
    local pic_dir=$(find "$PICTURES_DIR" -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" -o -name "*.JPG" -o -name "*.JPEG" -o -name "*.PNG" \) -newermt "$time_filter" -exec dirname {} \; 2>/dev/null | sort -u | head -1)
    
    if [ -n "$pic_dir" ]; then
        # Open the directory in ranger
        kitty ranger "$pic_dir"
    else
        # If no recent pictures found, show notification and open main directory
        notify-send "Picture Browser" "No pictures found for $label. Opening main directory."
        kitty ranger "$PICTURES_DIR"
    fi
}

case "$CHOICE" in
    "Today")
        open_pictures "$TODAY" "Today"
        ;;
    "Last 3 days")
        open_pictures "$THREE_DAYS_AGO" "Last 3 days"
        ;;
    "Last week")
        open_pictures "$WEEK_AGO" "Last week"
        ;;
    "Last month")
        open_pictures "$MONTH_AGO" "Last month"
        ;;
    *)
        # User cancelled or invalid choice
        exit 0
        ;;
esac
