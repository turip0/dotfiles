#!/bin/bash
cd ~/dotfiles/
git init
git add .
printf "\033[0;36m What should the commit message be? \e[0m"
read -r MESSAGE
git commit -a -m "$MESSAGE"
printf "\n \033[0;36m Remember!! \n Username: turip0 \n Password: You have to make a token!! \n \e[0m"
git push origin main
cd -
