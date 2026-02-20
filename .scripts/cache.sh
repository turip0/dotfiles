#!/bin/bash
#install dependency
mapfile -t dialogg < <(pacman -Qqe | grep dialog)
case ${dialogg[0]} in
'dialog') ;;
*)
  printf "${bold}Do you want to install dialog (y/n)${normal}\n"
  read -r dialoggg
  case ${dialoggg} in
  'n')
    exit
    ;;
  *)
    sudo pacman -S dialog
    ;;
  esac
  ;;
esac

sudo journalctl --vacuum-size=50M
cmd=(dialog --separate-output --title "[ Choose what you want to clean ]" --checklist "Select options (space):" 22 76 81)
options=(
  1 "Clean yay/pacman cahe" off # any option can be set to default to "on"
  2 "Clean homebrew" off
  3 "Clean flatpak" off
  4 "Remove orphan packages" off
  5 "Remove unwanted directories" off
  6 "Clear Trash" off
  7 "Remove Cache folder" off
  8 "check for failed daemons" off
  9 "Clean brave cache" off
)
if [ $? -ne 0 ]; then
  break
fi
choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
clear
for choice in $choices; do
  case $choice in
  1)
    sudo yay -Scc
    sudo paccache -r
    sudo rm -rf ~/go/pkg
    ;;
  2)
    brew cleanup
    ;;
  3)
    flatpak uninstall --unused
    sudo flatpak repair
    ;;
  4)
    sudo pacman -Rns $(pacman -Qtdq)
    ;;
  5)
    rm -f ~/pictures/screenshots/*.log
    rm -r ~/Thunderbird/ ~/Desktop/ ~/Downloads/
    ;;
  6)
    sudo rm -rf /home/.Trash-0
    sudo rm -rf ~/.local/share/Trash
    ;;
  7)
    sudo rm -rf ~/.cache/*
    ;;
  8)
    systemctl --failed
    ;;
  9)
    BRAVE_PROFILE_DIR="/home/turip/.config/BraveSoftware/Brave-Browser/Default" #Replace
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
    ;;
  esac
  clear
  printf "\033[0;35m╭───────────────────────────────────╮\n│\e[92mCache options cleared succesfully!\033[0;35m │\n\033[0;35m└───────────────────────────────────┘\n\e[0m"
done
