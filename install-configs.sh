#!/bin/bash

# Simple config symlink setup script
# Run this to set up symlinks for fish, kitty, rofi, and ranger configs

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "WARNING: Not tested on a fresh install yet"
echo "Setting up config symlinks..."

# Check if files exist and warn user
if [ -f ~/.config/fish/config.fish ] && [ ! -L ~/.config/fish/config.fish ]; then
    echo "ERROR: ~/.config/fish/config.fish already exists!"
    echo "Please move it first: mv ~/.config/fish/config.fish ~/.config/fish/config.fish.backup"
    exit 1
fi

if [ -f ~/.config/kitty/kitty.conf ] && [ ! -L ~/.config/kitty/kitty.conf ]; then
    echo "ERROR: ~/.config/kitty/kitty.conf already exists!"
    echo "Please move it first: mv ~/.config/kitty/kitty.conf ~/.config/kitty/kitty.conf.backup"
    exit 1
fi

if [ -f ~/.config/rofi/config.rasi ] && [ ! -L ~/.config/rofi/config.rasi ]; then
    echo "ERROR: ~/.config/rofi/config.rasi already exists!"
    echo "Please move it first: mv ~/.config/rofi/config.rasi ~/.config/rofi/config.rasi.backup"
    exit 1
fi

if [ -f ~/.config/ranger/rc.conf ] && [ ! -L ~/.config/ranger/rc.conf ]; then
    echo "ERROR: ~/.config/ranger/rc.conf already exists!"
    echo "Please move it first: mv ~/.config/ranger/rc.conf ~/.config/ranger/rc.conf.backup"
    exit 1
fi

if [ -d ~/.config/espanso ] && [ ! -L ~/.config/espanso ]; then
    echo "ERROR: ~/.config/espanso already exists!"
    echo "Please move it first: mv ~/.config/espanso ~/.config/espanso.backup"
    exit 1
fi

# Create directories if needed
mkdir -p ~/.config/fish
mkdir -p ~/.config/kitty
mkdir -p ~/.config/rofi
mkdir -p ~/.config/ranger

# Create symlinks
ln -sf "$REPO_DIR/configs/fish/config.fish" ~/.config/fish/config.fish
ln -sf "$REPO_DIR/configs/kitty/kitty.conf" ~/.config/kitty/kitty.conf
ln -sf "$REPO_DIR/configs/rofi/config.rasi" ~/.config/rofi/config.rasi
ln -sf "$REPO_DIR/configs/ranger/rc.conf" ~/.config/ranger/rc.conf
ln -sf "$REPO_DIR/configs/espanso" ~/.config/espanso

echo "✓ configs symlinked"
