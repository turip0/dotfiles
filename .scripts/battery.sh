#!/bin/sh

while true; do
  battery=$(upower -i "$(upower -e | grep BAT)" | grep -E "percentage" | awk '{print $2}' | tr -d '%')
  if [ "$battery" -le "30" ]; then
    notify-send -t 6000 -u critical -a "Low battery" "${battery}%"
    # hyprctl notify 0 8000 0 "  Low battery: ${battery}%"
    ffplay -autoexit -nodisp ~/.scripts/assets/alert.mp3
    sleep 240
  else
    sleep 120
  fi
done
