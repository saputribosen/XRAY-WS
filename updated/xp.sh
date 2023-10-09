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
if [ $MYIP = $MYIP ]; then
echo -e "${NC}${GREEN}Permission Accepted...${NC}"
else
echo -e "${NC}${RED}Permission Denied!${NC}";
echo -e "${NC}${LIGHT}Please Contact Admin!!"
echo -e "${NC}${LIGHT}Telegram : https://t.me/Opindoo"
exit 0
fi

# CODE AKUN XRAY DI /etc/xray/config.json
# ====================
# vmess = ###
# vless = ####
# trojan = #&#
# shadowsocks = ##&#
# ====================
clear
# Delete Vmess
data=( $(cat /etc/xray/config.json | grep '^###' | cut -d ' ' -f 2) );
now=$(date +"%Y-%m-%d");
for user in "${data[@]}"; do
 exp=$(grep -w "^### $user" /etc/xray/config.json | cut -d ' ' -f 3 | sort | uniq);
 d1=$(date -d "$exp" +%s);
 d2=$(date -d "$now" +%s);
 exp2=$(( (d1 - d2) / 86400 ));
 if [[ "$exp2" = "0" ]]; then
  sleep 1
  sed -i "/^### $user $exp/,/^},{/d" /etc/xray/config.json
  rm -f "/etc/xray/vmess-$user-tls.json" "/etc/xray/vmess-$user-nontls.json" "/etc/xray/vmess-$user-grpc.json"
  rm -f "/usr/bin/vmess/vmess-$user.txt" "/usr/bin/vmess/vmess-$user-ntls.txt" "/usr/bin/vmess/vmess-$user-grpc.txt"
 fi
done
# Delete trojan
data=( $(cat /etc/xray/config.json | grep '^#&#' | cut -d ' ' -f 2) );
now=$(date +"%Y-%m-%d");
for user in "${data[@]}"; do
 exp=$(grep -w "^#&# $user" /etc/xray/config.json | cut -d ' ' -f 3 | sort | uniq);
 d1=$(date -d "$exp" +%s);
 d2=$(date -d "$now" +%s);
 exp2=$(( (d1 - d2) / 86400 ));
 if [[ "$exp2" = "0" ]]; then
  sleep 1
  sed -i "/^#&# $user $exp/,/^},{/d" /etc/xray/config.json
  rm -f "/usr/bin/trojan/trojan-$user.txt" "/usr/bin/trojan/trojan-$user-grpc.txt"
 fi
done
# Delete Vless
data=( $(cat /etc/xray/config.json | grep '^####' | cut -d ' ' -f 2) );
now=$(date +"%Y-%m-%d");
for user in "${data[@]}"; do
 exp=$(grep -w "^#### $user" /etc/xray/config.json | cut -d ' ' -f 3 | sort | uniq);
 d1=$(date -d "$exp" +%s);
 d2=$(date -d "$now" +%s);
 exp2=$(( (d1 - d2) / 86400 ));
 if [[ "$exp2" = "0" ]]; then
   sleep 1
   sed -i "/^#### $user $exp/,/^},{/d" /etc/xray/config.json
   rm -f /usr/bin/vless/vless-$user.txt
 fi
done
# Delete shadowsocks
data=( $(cat /etc/xray/config.json | grep '^##&#' | cut -d ' ' -f 2) );
now=$(date +"%Y-%m-%d");
for user in "${data[@]}"; do
 exp=$(grep -w "^##&# $user" /etc/xray/config.json | cut -d ' ' -f 3 | sort | uniq);
 d1=$(date -d "$exp" +%s);
 d2=$(date -d "$now" +%s);
 exp2=$(( (d1 - d2) / 86400 ));
 if [[ "$exp2" = "0" ]]; then
  sleep 1
  sed -i "/^##&# $user $exp/,/^},{/d" /etc/xray/config.json
  rm -f /home/vps/public_html/ss-ws-$user.txt
  rm -f /home/vps/public_html/ss-grpc-$user.txt
  rm -f /usr/bin/shadowsock/ss-$user.txt
 fi
done
restart-xray
