#!/bin/sh

while true; do
  battery=$(upower -i "$(upower -e | grep BAT)" | grep -E "percentage" | awk '{print $2}' | tr -d '%')
  if [ "$battery" -le "30" ]; then
    hyprctl -u urgent notify 0 5000 0 "  Low battery: ${battery}%"
    ffplay -autoexit -nodisp ~/.scripts/assets/alert.mp3
    sleep 240
  else
    sleep 120
  fi
done
