#!/bin/bash
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
# =========================================
# Getting
MYIP=$(wget -qO- ipinfo.io/ip);
# ==================================================
# Link Hosting Kalian
airassh="raw.githubusercontent.com/saputribosen/scriptfree/main/ssh"
#
cd
# Collor Status
error1="${RED} [ERROR] ${NC}"
success="${GREEN} [OK] ${NC}"

# Cek Domain
source /var/lib/airavpn/ipvps.conf || echo "Domain tidak ditemukan"

# Edit file /etc/systemd/system/rc-local.service
cat > /etc/systemd/system/rc-local.service <<-END
[Unit]
Description=Run /etc/rc.local
ConditionPathExists=/etc/rc.local
[Service]
Type=forking
ExecStart=/etc/rc.local start
TimeoutSec=0
StandardOutput=tty
RemainAfterExit=yes
SysVStartPriority=99
[Install]
WantedBy=multi-user.target
END

# Buat file /etc/rc.local
cat > /etc/rc.local <<-END
#!/bin/sh -e
# rc.local
# By default this script does nothing.

sslh-fix-reboot
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 100
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 100
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 100
systemctl enable xray
systemctl restart xray
systemctl restart nginx
systemctl enable runn
systemctl restart runn
iptables -I INPUT -p udp --dport 5300 -j ACCEPT
iptables -t nat -I PREROUTING -p udp --dport 53 -j REDIRECT --to-ports 5300
echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6
exit 0
END

# Ubah izin akses
chmod +x /etc/rc.local

# Enable rc local
systemctl enable rc-local
systemctl start rc-local.service

# Set timezone ke GMT+7
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime

# Disable AcceptEnv di SSH Config
sed -i 's/^AcceptEnv/#AcceptEnv/g' /etc/ssh/sshd_config
systemctl restart sshd

# Install dependensi yang diperlukan
apt update -y
apt upgrade -y
apt install -y \
  wget curl sudo nano net-tools \
  gnupg software-properties-common unzip zip \
  nginx php php-cli php-fpm php-mysql \
  build-essential libssl-dev \
  screen iptables neofetch git

# Konfigurasi Nginx dan PHP
rm /etc/nginx/sites-enabled/default
rm /etc/nginx/sites-available/default
curl https://${airassh}/nginx.conf > /etc/nginx/nginx.conf
curl https://${airassh}/vps.conf > /etc/nginx/conf.d/vps.conf
sed -i 's/listen = \/run\/php\/php.*-fpm.sock/listen = 127.0.0.1:9000/g' /etc/php/7.4/fpm/pool.d/www.conf

# Direktori web
useradd -m vps
mkdir -p /home/vps/public_html
echo "<?php phpinfo(); ?>" > /home/vps/public_html/info.php
chown -R www-data:www-data /home/vps/public_html
chmod -R g+rw /home/vps/public_html

# Restart layanan
systemctl restart nginx
systemctl restart php7.4-fpm

# Tambahkan repositori terbaru untuk PHP jika diperlukan
add-apt-repository ppa:ondrej/php -y
apt update -y
apt install -y php8.2 php8.2-fpm php8.2-mysql

# Gunakan PHP terbaru
update-alternatives --set php /usr/bin/php8.2

# Restart semua layanan
systemctl restart nginx
systemctl restart php8.2-fpm

# Bersihkan
apt autoremove -y
echo "clear" >> ~/.bashrc
echo "neofetch" >> ~/.bashrc

# Informasi Selesai
clear
echo -e "${success} Setup selesai! Periksa konfigurasi server Anda."
