#!/bin/bash

# Create autostart directory if it doesn't exist
mkdir -p ~/.config/autostart

# Path to your backed up desktop files
BACKUP_PATH="/home/mat/Documents/ProgramExperiments/.setup/autostart"

# Make all backup desktop files executable first
chmod +x "$BACKUP_PATH"/*.desktop
echo "Made backup files executable"

# Create symlinks for all .desktop files
for file in "$BACKUP_PATH"/*.desktop; do
  filename=$(basename "$file")
  ln -sf "$file" "$HOME/.config/autostart/$filename"
  echo "Created symlink for $filename"
done

echo "Autostart configuration complete!"
