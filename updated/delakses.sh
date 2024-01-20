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
config_file="/etc/xray/config.json"
unique_admins=$(awk '/email:/{print $NF}' "$log_file" | sort -u)

# Kecualikan Tes ping
excluded_domains="www\.gstatic\.com:80\|bing\.com:80\|cp\.cloudflare\.com:80\|ping\.xmbb\.net:80"

# Cek akun multilogin
for admin_email in $unique_admins; do
    # Cek apakah ada hasil yang sesuai
    if grep -w "email: $admin_email" "$log_file" | grep "accepted" | grep -v "$excluded_domains" > /dev/null; then
        echo -e "${NC}Cek: ${GREEN} $admin_email ${NC}"
        echo ""
        
        # Hitung jumlah alamat IP unik
        ip_count=$(grep -w "email: $admin_email" "$log_file" | grep "accepted" | grep -v "$excluded_domains" | awk '{split($3, a, ":"); if($3 ~ /tcp/) print a[2]; else print a[1]}' | sort -u | wc -l)
        
        # Tampilkan dan perbarui config.json jika jumlah IP lebih dari 5
        if [ "$ip_count" -gt 5 ]; then
            sed -i "/\"email\": \"$admin_email\"/ s/\(},\)/#},/" "$config_file"
            echo -e "${NC}Penggunaan Akun Bar-bar"
            #tambahkan script bot telegram jika ada
        fi    

    fi
done
clear
sleep 1
truncate -s 0 "$log_file"
systemctl restart xray
