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
#Getting
MYIP=$(wget -qO- ipinfo.io/ip);
# echo "Checking VPS"
# IZIN=$(curl https://raw.githubusercontent.com/saputribosen/XRAY-WS/main/ipvps/ipvps.txt | grep $MYIP | awk '{print $3}')
# if [ $MYIP = $MYIP ]; then
# echo -e "${NC}${GREEN}Permission Accepted...${NC}"
# else
# echo -e "${NC}${RED}Permission Denied!${NC}";
# echo -e "${NC}${LIGHT}Please Contact Admin!!"
# echo -e "${NC}${LIGHT}Telegram : https://t.me/Opindoo"
# exit 0
# fi
error1="${RED} [ERROR] ${NC}"
success="${GREEN} [OK] ${NC}"
#Domain lama
source /var/lib/airavpn/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP
fi
clear
echo -e "========================="
read -rp "Input Domain/Host : " -e domain1
echo -e "========================="
echo -e "Domain di tambahkan: ${GREEN}${domain1} ${NC}Please Wait..."
echo -e "========================="
sleep 3

# Cek DNS terubung dengan VPS atau tidak
# cekdomain=$(curl -sm8 http://ipget.net/?ip="${domain1}")
# if [[ ${MYIP} == ${cekdomain} ]]; then
#     clear
#     echo -e "${success}Domain: ${BLUE}${domain1} ${NC}Terhubung dengan IP VPS"
#     sleep 3
# else
#     clear
#     echo -e "${error1}Domain: ${BLUE}${domain1} ${NC}Tidak Terhubung dengan IP VPS"
#     sleep 3
#     exit 0
#fi
# done
#buat folder akun
mkdir /usr/bin/trojan
mkdir /usr/bin/vmess
mkdir /usr/bin/vless
mkdir /usr/bin/shadowsock
#permission
chmod +x /usr/bin/trojan
chmod +x /usr/bin/vmess
chmod +x /usr/bin/vless
chmod +x /usr/bin/shadowsock
# Delete Files
rm -f /etc/xray/xray.crt
rm -f /etc/xray/xray.key
rm -f /root/domain
rm -f /etc/xray/domain
# Done
echo $domain1 >> /etc/xray/domain
echo $domain1 >> /root/domain
echo "IP=$domain1" >> /var/lib/airavpn/ipvps.conf

#Bersihkan terminal
clear
sleep 1
echo -e "Upgrade ${NC}Please Wait..."
apt update -y && apt upgrade -y
#Install Kelengkapan
apt install curl socat xz-utils wget apt-transport-https gnupg gnupg2 gnupg1 dnsutils lsb-release -y 
apt install socat cron bash-completion ntpdate -y
ntpdate pool.ntp.org
apt -y install chrony
timedatectl set-ntp true
systemctl enable chronyd && systemctl restart chronyd
systemctl enable chrony && systemctl restart chrony
timedatectl set-timezone Asia/Jakarta
chronyc sourcestats -v
chronyc tracking -v
mkdir -p /etc/xray
sudo lsof -t -i tcp:80 -s tcp:listen | sudo xargs kill
cd /root/
curl https://get.acme.sh | sh
bash acme.sh --install
cd .acme.sh
bash acme.sh --set-default-ca --server letsencrypt
bash acme.sh --register-account -m aryobrokolly92@gmail.com
bash acme.sh --issue -d $domain1 --standalone
bash acme.sh --installcert -d $domain1 --fullchainpath /etc/xray/xray.crt --keypath /etc/xray/xray.key
sleep 3
clear
