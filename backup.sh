#!/bin/bash

# Usage: ./backup_dotfiles.sh /path/to/backup

# List of folders/files to back up from ~/.config
CONFIGS=(
    # "autostart"
    # "clangd"
    # "Code"
    # "discord"
    # "dolphinrc"
    "fastfetch"
    # "htop"
    "hypr"
    "kitty"
    "nvim"
    # "nwg-displays"
    # "obsidian"
    # "okularrc"
    # "pulse"
    # "systemd"
    "waybar"
    "wofi"
    # "yay"
)

# Ensure target backup dir is provided
if [ -z "$1" ]; then
    echo "Usage: $0 /path/to/backup"
    exit 1
fi

BACKUP_DIR="$1"

mkdir -p "$BACKUP_DIR"

for item in "${CONFIGS[@]}"; do
    SRC="$HOME/.config/$item"
    DEST="$BACKUP_DIR/$item"
    if [ -e "$SRC" ]; then
        echo "Backing up $item..."
        cp -r "$SRC" "$DEST"
    else
        echo "Skipping $item (not found)"
    fi
done

echo "Backup complete to $BACKUP_DIR"

