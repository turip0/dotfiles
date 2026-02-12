#!/bin/bash
CYAN="\e[0;36;1m"
RESET="\e[0m"

mapfile -t stoww < <(pacman -Qqe | grep stow)
case ${stoww[0]} in
'stow') ;;
*)
  printf "${CYAN}install stow? n/y (deafult)${RESET} "
  read -r install
  case $install in
  'y')
    sudo pacman -S stow
    ;;
  'n') ;;
  'no') ;;
  *)
    sudo pacman -S stow
    ;;
  esac
  ;;
esac

mapfile -t gitt < <(pacman -Qqe | grep git)
case ${gitt[1]} in
'git') ;;
*)
  printf "${CYAN}install git? n/y (deafult)${RESET} "
  read -r install
  case $install in
  'y')
    sudo pacman -S git
    ;;
  'n') ;;
  'no') ;;
  *)
    sudo pacman -S git
    ;;
  esac
  ;;
esac

printf "${CYAN}Do you want to replace old configs? Y/n (deafult)${RESET} "
read -r safe
case $safe in
'y')
  stow --adopt .
  ;;
*)
  stow .
  ;;
esac
printf "\n \e[0;32;1m dotfiles symlinked successfully!! \e[0m"
