#!/bin/bash
touch ~/.scripts/tmp/temp
NUM=$HOME/.scripts/tmp/num
NUM_2=$HOME/.scripts/tmp/num2
TEMP=$HOME/.scripts/tmp/temp
echo "you have installed " >$NUM
pacman -Qqe >>$TEMP
cat $TEMP | wc -l >>$NUM
echo " packages (pacman)" >>$NUM
tr -d "\n\r" <$NUM >$NUM_2

cat $TEMP | lolcat
echo "-----------------------------"
cat $NUM_2
cat $NUM_2 | xargs -I{} notify-send {}
rm -f $NUM $TEMP $NUM_2
