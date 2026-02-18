#!/bin/bash

clear
echo "================================"
echo "      Welcome to Vital VPS      "
echo "================================"
echo ""
echo "1. Install Pterodactyl"
echo "2. Install Wings"
echo "3. Exit"
echo ""
read -p "Choose an option: " option

case $option in
1)
    echo "Installing Pterodactyl..."
    # install command here
    ;;
2)
    echo "Installing Wings..."
    # install command here
    ;;
3)
    echo "Goodbye!"
    exit
    ;;
*)
    echo "Invalid option"
    ;;
esac
