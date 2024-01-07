#!/bin/bash
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
BRED="\e[41m"
BBLUE="\e[38;5;21m"
#information
OK="${GREEN}[OK]${NC}"
Error="${RED}[Mistake]${NC}"
#pkg install ncurses-utils
#echo -e "Getting Information Please Wait...."
is_root() {
    if [ 0 == $UID ]; then
        echo -e "${OK} ${NC} The current user is the root user..${NC}"
        sleep 1
        echo -e "Getting Information...."
    else
        echo -e "${Error} ${NC} Please switch to the root user and execute start-menu again ${NC}"
        exit 1
    fi
}
is_root
#pkg install ncurses-utils
ip=$(wget -qO- ipinfo.io/ip)
domainhost=$(cat /root/domain)
region=$(wget -qO- ipinfo.io/region)
isp=isp=$(curl -s https://geo.ipify.org/api/v2/country?apiKey=at_nvxWC3jIF8ytroWk7W8vc9DRrc6gk | grep -o '"isp": *"[^"]*"' | cut -d'"' -f4)
timezone=$(wget -qO- ipinfo.io/timezone)
ossys=$(neofetch | grep "OS" | cut -d: -f2 | sed 's/ //g')
host=$(neofetch | grep "Host" | cut -d: -f2 | sed 's/ //g')
kernel=$(neofetch | grep "Kernel" | cut -d: -f2 | sed 's/ //g')
uptime=$(neofetch | grep "Uptime" | cut -d: -f2 | sed 's/ //g')
cpu=$(neofetch | grep "CPU" | cut -d: -f2 | sed 's/ //g')
memory=$(neofetch | grep "Memory" | cut -d: -f2 | sed 's/ //g')
echo -e "Getting Information..."
clear
# echo -e "$BLUE━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"$NC
# echo -e "$BPURPLE           SELAMAT DATANG            $NC"
# echo -e "$BLUE━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"$NC
# figlet LIZSVR | lolcat
# #echo -e "$NC"
# echo -e "Telegram : @Opindoo"
echo -e "$BLUE━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
echo -e "$BRED          Informasi System           $NC"
echo -e "$BLUE━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
echo -e "$CLAY IP Address :$NC $ip $NC"
echo -e "$CLAY Domain :$NC $domainhost $NC"
echo -e "$CLAY Region :$NC $region $NC"
echo -e "$CLAY ISP :$NC $isp $NC"
echo -e "$CLAY Host :$NC $host $NC"
echo -e "$CLAY CPU :$NC $cpu $NC"
echo -e "$CLAY Kernel :$NC $kernel $NC"
echo -e "$CLAY Up Time :$NC $uptime $NC"
echo -e "$CLAY OS System :$NC $ossys $NC"
echo -e "$CLAY Time Zone :$NC $timezone $NC"
echo -e "$CLAY Date :$NC $(date +%A) $(date +%m-%d-%Y)"
echo -e "$CLAY Memory :$NC $memory $NC"
echo -e "$BLUE━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
echo -e "$BRED           Service Status            $NC"
echo -e "$BLUE━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
#
#
# sshs=$(systemctl status ssh | grep Active: | awk '{print $2}')
# wstls=$(systemctl status ws-tls | grep Active: | awk '{print $2}')
# wsnontls=$(systemctl status ws-nontls | grep Active: | awk '{print $2}')
# ovpns=$(systemctl status openvpn-ohp | grep Active: | awk '{print $2}')
# sttunl5=$(systemctl status stunnel5 | grep Active: | awk '{print $2}')
# dropbears=$(systemctl status dropbear | grep Active: | awk '{print $2}')
nginxs=$(systemctl status nginx | grep Active: | awk '{print $2}')
crons=$(systemctl status cron | grep Active: | awk '{print $2}')
# fails=$(systemctl status fail2ban | grep Active: | awk '{print $2}')
xrays=$(systemctl status xray | grep Active: | awk '{print $2}')
ell=active
#
#
if [ "$xrays" == "$ell" ]; then
echo -e " XRAYS WS/GRPC           :$GREEN [Running] $NC"
else
echo -e " XRAYS WS/GRPC           :$RED [Error] $NC"
fi
# if [ "$sshs" == "$ell" ]; then
# echo -e " SSH                     :$GREEN [Running] $NC"
# else
# echo -e " SSH                     :$RED [Error] $NC"
# fi
# if [ "$wstls" == "$ell" ]; then
# echo -e " Websocket TLS           :$GREEN [Running] $NC"
# else
# echo -e " Websocket TLS           :$RED [Error] $NC"
# fi
# if [ "$wsnontls" == "$ell" ]; then
# echo -e " Websocket Non TLS       :$GREEN [Running] $NC"
# else
# echo -e " Websocket Non TLS       :$RED [Error] $NC"
# fi
# if [ "$ovpns" == "$ell" ]; then
# echo -e " OpenVPN                 :$GREEN [Running] $NC"
# else
# echo -e " OpenVpn                 :$RED [Error] $NC"
# fi
# if [ "$sttunl5" == "$ell" ]; then
# echo -e " Stunnel 5               :$GREEN [Running] $NC"
# else
# echo -e " Stunnel 5               :$RED [Error] $NC"
# fi
# if [ "$dropbears" == "$ell" ]; then
# echo -e " Dropbear                :$GREEN [Running] $NC"
# else
# echo -e " Dropbear                :$RED [Error] $NC"
# fi
if [ "$nginxs" == "$ell" ]; then
echo -e " Nginx                   :$GREEN [Running] $NC"
else
echo -e " Nginx                   :$RED [Error] $NC"
fi
if [ "$crons" == "$ell" ]; then
echo -e " Cron                    :$GREEN [Running] $NC"
else
echo -e " Cron                    :$RED [Error] $NC"
fi
# if [ "$fails" == "$ell" ]; then
# echo -e " Fail2ban                :$GREEN [Running] $NC"
# else
# echo -e " Fail2ban                :$RED [Error] $NC"
# fi
echo -e "$BLUE━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
echo -e "$BRED---------  Script By ARYO  ----------"
echo -e "$BLUE━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
