#!/bin/bash
# bootstrap.sh — run this first on a new machine
sudo pacman -S --needed chezmoi
chezmoi init --apply git@github.com:Atraxus/dotfiles.git
