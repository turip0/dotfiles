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
    sudo rm -rf /var/cache/pac/pkg/*
    ;;
  2)
    brew cleanup
    ;;
  3)
    flatpak uninstall --unused
    flatpack() {
      echo 'Working on the system installation at /var/lib/flatpak'
      echo 'Privileges are required to make changes; assuming --dry-run'
      for i in {1..10}; do
        echo "[$i/10] stuff"
        sleep $((RANDOM % 2)).5
      done
      sleep 2
      echo 'Checking remotes...'
    }

    # Checks for a progress string "[current/total]". Capture group 1
    # captures the second number, total.
    is_progress() { [[ $1 =~ ^\[[0-9]+/([0-9]+)]$ ]]; }

    repair_progress() {
      # Consume all lines until the first line containing progress is
      # seen.
      while read -r p _ && ! is_progress "$p"; do :; done

      total=${BASH_REMATCH[1]}

      {
        # Output a line to compensate for the previously
        # consumed progress line.
        echo
        # Read all remaining lines and only output when it is a
        # progress line.
        while read -r p _; do
          is_progress "$p" && echo
        done
        # All lines have been read. Output one final lines to
        # get the progress to 100%.
        echo
        #      } | dialog --title "Repairing flatpak" --gauge "\nPlease wait..." 8 60 0
      } | pv \
        --discard \
        --line-mode \
        --name "Repairing flatpack" \
        --progress \
        --size "$((total + 1))"
    }

    flatpack repair | repair_progress
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
    clear
    TEMP=~/.scripts/tmp/tmp
    touch $TEMP
    systemctl --failed >$TEMP
    case $(grep "0" $TEMP) in
    '0 loaded units listed.')
      printf "\e[92m┌──────────────────────────────┐\n"
      printf "│\e[0m  No failed daemons spotted\e[92m   │\n│\e[0m All daemons running properly\e[92m │\n\033[0;36m"
      printf "\e[92m└──────────────────────────────┘\e[0m\n"
      ;;
    *)
      printf "$(cat $TEMP)\n\033[0;36m"
      ;;
    esac
    read -n 1 -s -r -p "  Press any key to continue "
    printf "\e[0m\n"
    clear
    rm -f $TEMP
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
done
clear
printf "\u001b[36m╭───────────────────────────────────╮\n│\e[0mCache options cleared succesfully!\u001b[36m │\n└───────────────────────────────────┘\n\e[0m"
