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
aktif="/var/log/xray/access.log"
akun="/etc/xray/config.json"
ademin=$(awk '/email:/{print $NF}' "$aktif" | sort -u)

# Kecualikan Tes ping
domainx="www\.gstatic\.com:80\|bing\.com:80\|cp\.cloudflare\.com:80\|ping\.xmbb\.net:80"

# Tampilkan
for emailuser in $ademin; do
    # Cek apakah ada hasil yang sesuai
    if grep -w "email: $emailuser" "$aktif" | grep "accepted" | grep -v "$domainx" > /dev/null; then
        jml_ip=$(grep -w "email: $emailuser" "$log_file" | grep "accepted" | grep -v "$domainx" | awk '{split($3, a, ":"); if($3 ~ /tcp/) print a[2]; else print a[1]}' | sort -u | wc -l)
        if [ "$jml_ip" -gt 5 ]; then
            sed -i "/\"email\": \"$emailuser\"/ s/\(},\)/#},/" "$akun"	
        fi    

    fi
sleep 1
restart-xray
done
