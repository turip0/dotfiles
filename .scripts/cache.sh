#!/bin/bash

# Clean package cache
sudo yay -Scc
sudo paccache -r
sudo rm -rf ~/go/pkg
flatpak uninstall --unused
brew cleanup
# Remove unused packages (orphans)
sudo pacman -Rns $(pacman -Qtdq)

# Clean the cache in your /home directory
sudo rm -rf ~/.cache/*
rm -rf ~/.local/share/Trash/
rm -r ~/Thunderbird/ ~/Desktop/
# Remove old logs
sudo journalctl --vacuum-size=50M

# Empty trash
sudo rm -rf /home/.Trash-0
sudo rm -rf ~/.local/share/Trash
