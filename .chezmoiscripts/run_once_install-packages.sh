#!/bin/bash
# run_once_ means chezmoi runs this exactly once per machine (tracked by content hash)

NATIVE=(
    hyprland waybar wofi alacritty neovim fastfetch
    # add your full list
)

AUR=(
    # paru -S targets
)

sudo pacman -S --needed "${NATIVE[@]}"
paru -S --needed "${AUR[@]}"
