#!/bin/bash

# Find the most recent .mkv file in ~/Videos
LATEST_VIDEO=$(find ~/Videos -name "*.mkv" -type f -printf '%T@ %p\n' | sort -nr | head -1 | cut -d' ' -f2-)

if [ -z "$LATEST_VIDEO" ]; then
    echo "No video files found in ~/Videos"
    exit 1
fi

echo "Converting: $LATEST_VIDEO"

# Get output filename by replacing extension with _copy.mp4
OUTPUT_FILE=$(echo "$LATEST_VIDEO" | sed 's/\.[^.]*$/_copy.mp4/')

# Convert using ffmpeg (same as mkv2mp4 function)
ffmpeg -i "$LATEST_VIDEO" -c copy "$OUTPUT_FILE"

if [ $? -eq 0 ]; then
    # Delete original file
    rm "$LATEST_VIDEO"
    echo "Deleted original: $LATEST_VIDEO"
    
    # Copy video file to clipboard for pasting
    nautilus "$OUTPUT_FILE"
    echo "Converted video file copied to clipboard: $OUTPUT_FILE"
else
    echo "Conversion failed"
    exit 1
fi
