#!/bin/bash

# Simple config symlink setup script
# Run this to set up symlinks for fish and kitty configs

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

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

# Create directories if needed
mkdir -p ~/.config/fish
mkdir -p ~/.config/kitty

# Create symlinks
ln -sf "$REPO_DIR/configs/fish/config.fish" ~/.config/fish/config.fish
ln -sf "$REPO_DIR/configs/kitty/kitty.conf" ~/.config/kitty/kitty.conf

echo "✓ configs symlinked"
