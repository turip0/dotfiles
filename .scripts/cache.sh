#!/bin/bash

# Clean package cache
sudo yay -Scc
sudo paccache -r
sudo rm -rf ~/go/pkg
flatpak uninstall --unused
sudo flatpak repair
rm ~/pictures/screenshots/*.log
brew cleanup
# Remove unused packages (orphans)
sudo pacman -Rns $(pacman -Qtdq)

# Clean the cache in your /home directory
sudo rm -rf ~/.cache/*
rm -rf ~/.local/share/Trash/
rm -r ~/Thunderbird/ ~/Desktop/ ~/Downloads/
# Remove old logs
sudo journalctl --vacuum-size=50M
# Brave
BRAVE_PROFILE_DIR="/home/user/.config/BraveSoftware/Brave-Browser/Default" #Replace
if [ -d "$BRAVE_PROFILE_DIR/Cache" ]; then
  rm -rf "$BRAVE_PROFILE_DIR/Cache/*"
  echo "Brave cache cleared."
else
  echo "Brave cache directory not found. Check the profile directory."
fi
if [ -d "$BRAVE_PROFILE_DIR/Media Cache" ]; then
  rm -rf "$BRAVE_PROFILE_DIR/Media Cache/*"
  echo "Brave Media Cache cleared."
else
  echo "Brave Media Cache directory not found. Check the profile directory."
fi

echo "Cache clearing process complete."
# Empty trash
sudo rm -rf /home/.Trash-0
sudo rm -rf ~/.local/share/Trash

systemctl --failed
