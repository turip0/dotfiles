#!/bin/bash
notify-send -u low -t 600000 -a "updates" "$(checkupdates | cat)"
exit
exit
