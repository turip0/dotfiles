#!/bin/bash
COL='\033[0;36m'
COLL='\033[0;35m'
SC=~/.scripts
DU=sudo du -sh / 2>$SC/tmp/stderr | grep -s -o "[0-9]*" >$SC/tmp/du
printf "${COL}╭──────────────────────╮"
printf "\n│${COLL}You are using: $(sudo cat $SC/tmp/du) GB  ${COL}│\n"
printf "│${COLL}Other "
printf "$((237 - $(sudo cat $SC/tmp/du)))"
printf "GB remaining ${COL}│\n"
printf "└──────────────────────┘\n\e[0m"
rm $SC/tmp/stderr $SC/tmp/du
