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
MYAD=$(curl -s https://ipinfo.io/org | cut -d ' ' -f 2-);
MYREG=$(wget -qO- ipinfo.io/region);
echo "Checking VPS"
IZIN=$(curl https://raw.githubusercontent.com/saputribosen/scriptfree/main/ipvps.txt | grep $MYIP | awk '{print $3}')
#if [ $MYIP = $MYIP ]; then
#echo -e "${NC}${GREEN}Permission Accepted...${NC}"
#else
#echo -e "${NC}${RED}Permission Denied!${NC}";
#echo -e "${NC}${LIGHT}Please Contact Admin!!"
#echo -e "${NC}${LIGHT}Telegram : https://t.me/Opindoo"
#exit 0
#fi
clear
source /var/lib/airavpn/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP
fi
tls="$(cat ~/log-install.txt | grep -w "XRAYS VLESS WS TLS" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "Username : " -e user
		CLIENT_EXISTS=$(grep -wE "^### ${user}" "/etc/xray/config.json" | sort | uniq | cut -d ' ' -f 2 |  wc -l)

		if [[ ${CLIENT_EXISTS} -ge '1' ]]; then
			echo ""
			echo -e "Username ${RED}${user}${NC} Already On VPS Please Choose Another"
   			sleep 3
      			clear
			addvmess
		fi
	done
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Expired (Days) : " masaaktif
sleep 3
echo -e "[ ${GREEN}TUNGGU${NC} ] Akun $user sedang dibuat... "
hariini=`date -d "0 days" +"%Y-%m-%d"`
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#vmess$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/config.json
cat>/etc/xray/vmess-$user-tls.json<<EOF
{
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "${tls}",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/vmess",
      "type": "none",
      "host": "${domain}",
      "tls": "tls"
}
EOF

## ubah config ke base64
vmess_base641=$( base64 -w 0 <<< $vmess_json1 )
xrayv2ray1="vmess://$(base64 -w 0 /etc/xray/vmess-$user-tls.json)"

cd /usr/bin/vmess
clear
echo -e "======-VMESS-WS-======" | tee -a vmess-${user}.txt
echo -e "ISP         : ${MYAD}" | tee -a vmess-${user}.txt
echo -e "Region      : ${MYREG}" | tee -a vmess-${user}.txt
echo -e "Remarks     : ${user}" | tee -a vmess-${user}.txt
echo -e "Host        : ${domain}" | tee -a vmess-${user}.txt
echo -e "Port TLS    : ${tls}" | tee -a vmess-${user}.txt
echo -e "UserID/UUID : ${uuid}" | tee -a vmess-${user}.txt
echo -e "Alter ID    : 0" | tee -a vmess-${user}.txt
echo -e "Security    : auto" | tee -a vmess-${user}.txt
echo -e "Network     : ws" | tee -a vmess-${user}.txt
echo -e "Path        : /vmess" | tee -a vmess-${user}.txt
echo -e "Created     : $hariini" | tee -a vmess-${user}.txt
echo -e "Expired     : $exp" | tee -a vmess-${user}.txt
echo -e "=========================" | tee -a vmess-${user}.txt
echo -e "Link TLS    : ${xrayv2ray1}" | tee -a vmess-${user}.txt
echo -e "=========================" | tee -a vmess-${user}.txt
echo -e "Terimakasih ${user}" | tee -a vmess-${user}.txt
echo -e "" | tee -a vmess-${user}.txt
telegram "
${domain} - $exp

${xrayv2ray1}

Vmess WS
"
sleep 6
systemctl restart xray.service
systemctl restart xray
service cron restart
read -p " ➣ Press Enter To Menu  " menu
echo -e ""
case $menu in
  *)
    clear
    bash menu
    ;;
esac
#
