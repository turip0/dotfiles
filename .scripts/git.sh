#!/bin/bash
cd ~/dotfiles/
printf "\033[0;36mDo you want to edit the README? y/n\e[0m\n"
read -r NV
case "$NV" in
'y')
  nvim README.md
  ;;
*) ;;
esac
git init
git add .
printf "\033[0;36mWhat should the commit message be? \e[0m"
read -r MESSAGE
git commit -a -m "$MESSAGE"
printf "\n \033[0;36mRemember!! \n Username: turip0 \n Password: You have to make a token!! \n \e[0m"
printf "\033[0;36m$(pass github/turip0)\n\e[0m"
git push origin main
cd -
