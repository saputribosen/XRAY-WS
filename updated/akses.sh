#!/bin/bash
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
clear
# Path to the log file
log_file="/var/log/xray/access.log"
unique_admins=$(awk '/email:/{print $NF}' "$log_file" | sort -u)

# Kecualikan Tes ping
excluded_domains="www\.gstatic\.com:80\|bing\.com:80\|cp\.cloudflare\.com:80\|ping\.xmbb\.net:80"

# Display
for admin_email in $unique_admins; do
    # Pengecekan apakah ada hasil yang sesuai
    if grep -w "email: $admin_email" "$log_file" | grep "accepted" | grep -v "$excluded_domains" > /dev/null; then
        echo -e "${NC}User: ${GREEN} $admin_email ${NC}"
        echo "---------------------"
        grep -w "email: $admin_email" "$log_file" | grep "accepted" | grep -v "$excluded_domains" | awk '{split($3, a, ":"); if($3 ~ /tcp/) print a[2]; else print a[1]}' | sort -u
        echo
    fi
done
