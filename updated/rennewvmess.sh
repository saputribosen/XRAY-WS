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
domain=$(cat /etc/xray/domain)
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
clear
NUMBER_OF_CLIENTS=$(grep -E "^### " "/etc/xray/config.json" | sort | uniq | cut -d ' ' -f 2 | wc -l)
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		clear
		echo ""
		echo "You have no existing clients!"
		exit 1
	fi

	clear
	echo ""
	echo "Select the existing client you want to renew"
	echo " Press CTRL+C to return"
	echo -e "==============================="
	grep -E "^### " "/etc/xray/config.json" | cut -d ' ' -f 2-3 | sort | uniq | column -t | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done

user=$(grep -E "^### " "/etc/xray/config.json" | sort | uniq | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/etc/xray/config.json" | sort | uniq | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
lokasi=/etc/xray/config.json
lok=/usr/bin/vmess/vmess-$user.txt
lokntls=/usr/bin/vmess/vmess-$user-ntls.txt

clear
echo -e ""
echo -e "==============================="
echo -e "      Account Information"
echo -e "==============================="
echo -e "${CLAY}Username : $user "
echo -e "Expired  : $exp ${NC}"
echo -e "==============================="
read -p "Add Expired (Days): " masaaktif
echo -e "Please Wait...."
sleep 2
now=$(date +%Y-%m-%d)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
exp3=$(($exp2 + $masaaktif))
exp4=`date -d "$exp3 days" +"%Y-%m-%d"`
sed -i "/### $user $exp/c\\### $user $exp4" $lokasi
sed -i "/Expired     : $exp/c\\Expired     : $exp4" "$lok" || sed -i "/Expired     : $exp/c\\Expired     : $exp4" "$lokntls"
clear
echo ""
echo "==============================="
echo "      Vmess Account Renewed    "
echo "==============================="
echo "Username 	    : $user"
echo "Expired New   : $exp4"
echo "==============================="
echo " "
telegram "
Renew Vmess Account!!

Username  : $user
Expired   : $exp4
"
sleep 5
systemctl restart xray.service
service cron restart
read -p " ➣ Select 0 BACK Renew | Enter To Menu :  " menu
echo -e ""

case $menu in
0)
rennewvmess
;;
  *)
    clear
    bash menu
    ;;
esac
#
