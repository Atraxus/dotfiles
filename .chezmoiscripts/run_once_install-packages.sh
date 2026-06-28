#!/bin/bash
# run_once_ means chezmoi runs this exactly once per machine (tracked by content hash)

#!/bin/bash
# run_once_install-packages.sh

NATIVE=(
    # Base
    base base-devel sudo git wget unzip less nano vim

    # Kernel & Boot
    linux linux-firmware linux-lts efibootmgr limine btrfs-progs zram-generator

    # Intel (swap these out if you ever move to AMD)
    intel-ucode intel-media-driver libva-intel-driver vulkan-intel sof-firmware

    # Network
    networkmanager network-manager-applet wpa_supplicant ufw

    # Audio
    pipewire pipewire-alsa pipewire-jack pipewire-pulse wireplumber libpulse gst-plugin-pipewire

    # Hyprland stack
    hyprland hyprlock hyprpaper hyprpolkitagent hyprshot hyprshutdown uwsm
    waybar wofi dunst nwg-displays
    grim slurp
    xdg-desktop-portal-hyprland xdg-desktop-portal-gtk xdg-utils
    qt5-wayland qt6-wayland polkit-kde-agent

    # Display & Session
    sddm power-profiles-daemon brightnessctl

    # Terminal & Shell
    alacritty fish neovim fastfetch htop tree-sitter-cli

    # GUI Apps
    firefox dolphin signal-desktop zathura zathura-pdf-mupdf feh

    # Bluetooth & Print
    bluez bluez-utils cups cups-pk-helper system-config-printer

    # Fonts
    noto-fonts noto-fonts-emoji
    ttf-jetbrains-mono ttf-jetbrains-mono-nerd
    ttf-dejavu ttf-dejavu-nerd
    adobe-source-code-pro-fonts adobe-source-sans-fonts adobe-source-serif-fonts

    # Sync
    syncthing
)

AUR=(
    # paru -S targets
    # shelly or yay
)

sudo pacman -S --needed "${NATIVE[@]}"
# paru -S --needed "${AUR[@]}"
