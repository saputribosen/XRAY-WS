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
echo "Checking Username"
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
echo -e "${NC}${GREEN}Processing Unsuspend...${NC}"
# Delete Vmess
sed -i '/^### /,/},{/ s/#},/},/' "/etc/xray/config.json"
sleep 1
sed -i '/^#&# /,/},{/ s/#},/},/' "/etc/xray/config.json"
sleep 1
sed -i '/^#&# /,/},{/ s/#},/},/' "/etc/xray/config.json"
sleep 1
systemctl restart xray
clear
telegram "Unsuspend Successfully..."
