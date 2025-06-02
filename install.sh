#!/bin/bash

# Main setup orchestrator script
# Runs all setup components for a complete system configuration

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "=== Starting Complete System Setup ==="
echo

# 1. Install config symlinks
echo "1. Setting up config symlinks..."
if [ -x "$SCRIPT_DIR/install-configs.sh" ]; then
    "$SCRIPT_DIR/install-configs.sh"
else
    echo "Warning: install-configs.sh not found or not executable"
fi
echo

# 2. Setup autostart applications
echo "2. Setting up autostart applications..."
if [ -x "$SCRIPT_DIR/setup-autostart.sh" ]; then
    "$SCRIPT_DIR/setup-autostart.sh"
else
    echo "Warning: setup-autostart.sh not found or not executable"
fi
echo

# 3. Setup keybinds
echo "3. Setting up keybinds..."
if [ -x "$SCRIPT_DIR/keybinds.sh" ]; then
    "$SCRIPT_DIR/keybinds.sh"
else
    echo "Warning: keybinds.sh not found or not executable"
fi
echo

echo "=== Setup Complete! ==="
echo "You may need to:"
echo "- Restart your terminal for config changes"
echo "- Log out/in for autostart apps to take effect"
echo "- Test keybinds functionality"