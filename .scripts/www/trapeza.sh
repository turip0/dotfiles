#!/bin/bash
clear
PURPLE='\033[0;36m'
NC='\033[0m' # No Color
echo -e "${bold}What subject to choose?${normal}"
echo -e "${PURPLE}------------------------${NC}"
echo -e "${PURPLE}|${NC}Άλγεβρα (1)           ${PURPLE}|${NC}"
echo -e "${PURPLE}|${NC}Γεωμετρία (2)         ${PURPLE}|${NC}"
echo -e "${PURPLE}|${NC}Α'Λυκείου (default)   ${PURPLE}|${NC}"
echo -e "${PURPLE}|${NC}specify number        ${PURPLE}|${NC}"
echo -e "${PURPLE}------------------------${NC}"
read -r class
case $class in
1)
  cha -V https://www.trapeza-thematon.gr/Mathima/5?handler=AllThemata
  ;;
2)
  cha -V https://www.trapeza-thematon.gr/Mathima/6?handler=AllThemata
  ;;
'')
  cha -V https://www.trapeza-thematon.gr/Class/1
  ;;
*)
  cha -V https://www.trapeza-thematon.gr/Thema/$class
  ;;
esac
