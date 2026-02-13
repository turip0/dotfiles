#!/bin/bash
cd ~/dotfiles/
git init
git add .
printf "What should the commit message be? "
read -r M
git commit -m "$(M)"
printf "\n \033[0;36m Remember!! \n Username: turip0 \n Password: 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 \n \e[0m"
git push origin main
cd -
