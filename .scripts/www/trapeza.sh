#!/bin/bash
clear
PURPLE='\033[0;36m'
NC='\033[0m' # No Color
echo -e "${PURPLE}  what browser to use?${NC}"
echo -e "\e[92m┌───────────────────────────┐"
echo -e "│\e[0m 1) Qute browser (default) \e[92m│"
echo -e "│\e[0m 2) Chawan (lightweight)   \e[92m│"
echo -e "└───────────────────────────┘\e[0m\n"
read -r br
case $br in
'2')
  browser='cha -V'
  ;;
*)
  dialog --title "[warning]" --yesno "\n   Make sure qute browser is already open!!\n            Have you lauched it?\n" 8 50
  case $? in
  0) ;;
  1)
    clear
    exit
    ;;
  esac
  browser='qutebrowser'
  ;;
esac
until [ $class = "q" ]; do
  clear
  echo -e "${bold}What subject to choose?${normal}"
  echo -e "${PURPLE}╭─────────────────────────╮${NC}"
  echo -e "${PURPLE}│${NC}-> Άλγεβρα (1)           ${PURPLE}│${NC}"
  echo -e "${PURPLE}│${NC}-> Γεωμετρία (2)         ${PURPLE}│${NC}"
  echo -e "${PURPLE}│${NC}-> Α'Λυκείου (default)   ${PURPLE}│${NC}"
  echo -e "${PURPLE}│${NC}-> specify number        ${PURPLE}│${NC}"
  echo -e "${PURPLE}│${NC}-> type 'q' to quit      ${PURPLE}│${NC}"
  echo -e "${PURPLE}└─────────────────────────┘${NC}"
  read -r class
  case $class in
  1)
    ${browser} https://www.trapeza-thematon.gr/Mathima/5?handler=AllThemata
    ;;
  2)
    ${browser} https://www.trapeza-thematon.gr/Mathima/6?handler=AllThemata
    ;;
  '')
    ${browser} https://www.trapeza-thematon.gr/Class/1
    ;;
  'q') ;;
  *)
    ${browser} https://www.trapeza-thematon.gr/Thema/$class
    ;;
  esac
done
