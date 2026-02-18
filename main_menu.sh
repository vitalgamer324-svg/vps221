#!/bin/bash

# Color Codes
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
NC='\033[0m'

clear

# Root Check
if [[ $EUID -ne 0 ]]; then
   echo -e "${RED}Please run as root!${NC}"
   exit 1
fi

# Logo
echo -e "${BLUE}"
echo "======================================"
echo "        VITAL GAMER VPS PANEL        "
echo "======================================"
echo -e "${NC}"

echo -e "${GREEN}1) Install Pterodactyl Panel${NC}"
echo -e "${GREEN}2) Install Wings${NC}"
echo -e "${GREEN}3) System Update${NC}"
echo -e "${GREEN}4) Check Server Info${NC}"
echo -e "${RED}0) Exit${NC}"
echo ""

read -p "Select an option: " option

case $option in

1)
    echo -e "${YELLOW}Installing Pterodactyl...${NC}"
    sleep 2
    ;;
    
2)
    echo -e "${YELLOW}Installing Wings...${NC}"
    sleep 2
    ;;

3)
    echo -e "${YELLOW}Updating system...${NC}"
    apt update && apt upgrade -y
    ;;

4)
    echo -e "${BLUE}Server Information:${NC}"
    echo "---------------------------"
    uptime
    free -h
    df -h
    ;;

0)
    echo -e "${RED}Exiting...${NC}"
    exit
    ;;

*)
    echo -e "${RED}Invalid Option!${NC}"
    ;;

esac
