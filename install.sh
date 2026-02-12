#!/bin/bash
#pacman -Qqe | grep stow > cat >> ~/tmp
mapfile -t stoww < <(pacman -Qqe | grep stow)
case ${stoww[0]} in
'stow') ;;
*)
  printf "install stow? n/y (deafult) "
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
stow .
