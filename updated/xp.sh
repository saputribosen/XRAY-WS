#!/bin/bash
# My Telegram : https://t.me/Opindoo
# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
# Getting
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
IZIN=$( curl https://raw.githubusercontent.com/saputribosen/scriptfree/main/ipvps.txt | grep $MYIP )
#if [ $MYIP = $MYIP ]; then
#echo -e "${NC}${GREEN}Permission Accepted...${NC}"
#else
#echo -e "${NC}${RED}Permission Denied!${NC}";
#echo -e "${NC}${LIGHT}Please Contact Admin!!"
#echo -e "${NC}${LIGHT}Telegram : https://t.me/Opindoo"
#exit 0
#fi

# CODE AKUN XRAY DI /etc/xray/config.json
# ====================
# vmess = ###
# vless = ####
# trojan = #&#
# shadowsocks = ##&#
# ====================
clear
systemctl restart xray
now=$(date +"%Y-%m-%d")
config_file="/etc/xray/config.json"
# Delete Vmess
grep "^### " "$config_file" | while read -r line; do
    if [[ "$line" =~ ^"### " ]]; then
        
        user=$(echo "$line" | awk '{print $2}')
        expiration_date=$(echo "$line" | awk '{print $3}')

        # Check if the expiration date is today
        if [[ "$expiration_date" == "$now" ]]; then
            # Remove the user configuration
            sed -i "/^### $user/,/},{/d" "$config_file"

            telegram "User $user has been removed. (Vmess)"
        fi
    fi
done
sleep 1
# Delete trojan
grep "^#&# " "$config_file" | while read -r line; do
    if [[ "$line" =~ ^"#&# " ]]; then
        
        user=$(echo "$line" | awk '{print $2}')
        expiration_date=$(echo "$line" | awk '{print $3}')

        # Check if the expiration date is today
        if [[ "$expiration_date" == "$now" ]]; then
            # Remove the user configuration
            sed -i "/^#&# $user/,/},{/d" "$config_file"

            telegram "User $user has been removed. (Trojan)"
        fi
    fi
done
sleep 1
# Delete Vless
grep "^#### " "$config_file" | while read -r line; do
    if [[ "$line" =~ ^"#### " ]]; then
        
        user=$(echo "$line" | awk '{print $2}')
        expiration_date=$(echo "$line" | awk '{print $3}')

        # Check if the expiration date is today
        if [[ "$expiration_date" == "$now" ]]; then
            # Remove the user configuration
            sed -i "/^#### $user/,/},{/d" "$config_file"

            telegram "User $user has been removed. (Vless)"
        fi
    fi
done
sleep 1
# Delete shadowsocks
grep "^##&# " "$config_file" | while read -r line; do
    if [[ "$line" =~ ^"##&# " ]]; then
        
        user=$(echo "$line" | awk '{print $2}')
        expiration_date=$(echo "$line" | awk '{print $3}')

        # Check if the expiration date is today
        if [[ "$expiration_date" == "$now" ]]; then
            # Remove the user configuration
            sed -i "/^##&# $user/,/},{/d" "$config_file"

            telegram "User $user has been removed. (shadowsock)"
        fi
    fi
done
sleep 1
systemctl restart xray
menu
