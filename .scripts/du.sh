#!/bin/bash
# Load in the functions and animations
source ~/.scripts/loading_animations/bash_loading_animations.sh
# Run BLA::stop_loading_animation if the script is interrupted
trap BLA::stop_loading_animation SIGINT

COL='\033[0;36m'
COLL='\033[0;35m'
SC=~/.scripts
sudo printf "${COLL}"

BLA::start_loading_animation "${BLA_modern_metro[@]}"
printf "         Please wait, calculating"
DU=sudo du -sh / 2>$SC/tmp/stderr | grep -s -o "[0-9]*" >$SC/tmp/du
BLA::stop_loading_animation

printf "${COL}\n╭──────────────────────╮"
printf "\n│${COLL}You are using: $(sudo cat $SC/tmp/du) GB  ${COL}│\n"
printf "│${COLL}Other "
printf "$((237 - $(sudo cat $SC/tmp/du)))"
printf "GB remaining ${COL}│\n"
printf "└──────────────────────┘\n\e[0m"
rm $SC/tmp/stderr $SC/tmp/du
