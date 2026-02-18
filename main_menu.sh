#!/bin/bash

# ===== COLOR =====
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
CYAN='\033[1;36m'
NC='\033[0m'

clear

# ===== GAMING ASCII LOGO =====
echo -e "${CYAN}"
echo "██╗   ██╗██╗████████╗ █████╗ ██╗         ██████╗  █████╗ ███╗   ███╗███████╗"
echo "██║   ██║██║╚══██╔══╝██╔══██╗██║        ██╔════╝ ██╔══██╗████╗ ████║██╔════╝"
echo "██║   ██║██║   ██║   ███████║██║        ██║  ███╗███████║██╔████╔██║█████╗  "
echo "╚██╗ ██╔╝██║   ██║   ██╔══██║██║        ██║   ██║██╔══██║██║╚██╔╝██║██╔══╝  "
echo " ╚████╔╝ ██║   ██║   ██║  ██║███████╗   ╚██████╔╝██║  ██║██║ ╚═╝ ██║███████╗"
echo "  ╚═══╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚══════╝    ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝"
echo -e "${NC}"
echo -e "${GREEN}       VITAL GAMER VPS INSTALLER${NC}"
echo ""

# ===== MENU =====
echo -e "${BLUE}1) Install Pterodactyl Panel${NC}"
echo -e "${BLUE}2) Auto Domain Setup (Nginx + SSL)${NC}"
echo -e "${BLUE}3) System Update${NC}"
echo -e "${RED}0) Exit${NC}"
echo ""

read -p "Select Option: " option

case $option in

1)
    echo -e "${YELLOW}Installing Pterodactyl Panel...${NC}"
    sleep 2
    bash <(curl -s https://pterodactyl-installer.se)
    ;;

2)
    echo -e "${CYAN}Enter your domain:${NC}"
    read domain

    apt update -y
    apt install nginx certbot python3-certbot-nginx -y

    cat > /etc/nginx/sites-available/panel <<EOF
server {
    listen 80;
    server_name $domain;

    location / {
        proxy_pass http://127.0.0.1:8080;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
    }
}
EOF

    ln -s /etc/nginx/sites-available/panel /etc/nginx/sites-enabled/
    nginx -t && systemctl restart nginx

    certbot --nginx -d $domain

    echo -e "${GREEN}Domain Setup Completed!${NC}"
    ;;

3)
    echo -e "${YELLOW}Updating System...${NC}"
    apt update && apt upgrade -y
    ;;

0)
    echo -e "${RED}Exiting...${NC}"
    exit
    ;;

*)
    echo -e "${RED}Invalid Option!${NC}"
    ;;

esac
