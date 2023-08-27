<p align="center">

# SCRIPT MULTI PORT 443/80
- ***Script XRAY Multi Port 443/80 MOD By ARYO***
- ***SCRIPT UNTUK MEMBUAT SERVER VPN***
#

# FITUR XRAY TLS
- TROJAN WS        : **443**
- TROJAN GRPC      : **443**
- SHADOWSOCKS WS   : **443**
- SHADOWSOCKS GRPC : **443**
- VMESS WS         : **443**
- VMESS GRPC       : **443**
- VLESS WS         : **443**
- VLESS GRPC       : **443**

# FITUR XRAY HTTP
- TROJAN WS        : **80**
- TROJAN GRPC      : **80**
- SHADOWSOCKS WS   : **80**
- SHADOWSOCKS GRPC : **80**
- VMESS WS         : **80**
- VMESS GRPC       : **80**
- VLESS WS         : **80**
- VLESS GRPC       : **80**

# MOD List & Updated
- Pengoptimalan Menu
- Menambahkan Tambah Domain Sebelum Install
- Pemisahan pembuatan dan penghapusan masing-masing akun service
- penambahan masa aktif/rennew akun
- fixed auto reboot 05:00 GTM +7 
- Add auto Expired
- dll

# OS 
- Debian 9 (HVM)
- Debian 10 (Tested)
* Berhasil di gunakan di vps Herza dan os debian 10
* untuk vps isp yg lain saya tidak tau, dan os yg lain juga saya tidak tau (belum coba)

# Syarat && Bahan Untuk Menggunakan Script Ini
- Wajib Punya VPS
- Wajib Punya Akun Cloudflare
- Wajib Punya Domain Punya Kamu Sendiri
- ***Jika semua syarat dan Bahan sudah terpenuhi, silahkan di coba script ini***

# Cara Install Script Nya
- Login ke VPS kamu ( wajib pake user ***root***)
1. MASUK KE VPS LALU KETIK
```
sudo su
```
***Jika tidak bisa lanjut ke script dibawah***

2. Update Dulu VPS NYA

```
apt update -y && apt upgrade -y && apt dist-upgrade -y && reboot
```
- Otomatis Akan Reboot / Hidupkan Ulang

3. Login Lagi Ke VPS NYA

4. Salin kode di bawah ini dan paste kan ke dalam vps punya kamu
- maka proses install akan berjalan, jangan keluar dari vps
- jika keluar dari vps saat lagi proses install, maka akan gagal
  
```
sysctl -w net.ipv6.conf.all.disable_ipv6=1 && sysctl -w net.ipv6.conf.default.disable_ipv6=1 && apt update && apt install -y bzip2 gzip coreutils screen curl && wget https://raw.githubusercontent.com/saputribosen/XRAY-WS/main/setup.sh && chmod +x setup.sh && ./setup.sh
```

5. jika sudah selesai,lalu ketik xmenu untuk menampilkan menu

```
menu
```
7. DONE / SELESAI

# Cara Perbaiki / FIX
- ***NOTE***
- jika xray dan nginx mengalami error !
- ketik
```
certxray
```
lalu ketik
```
restart-xray
```

# PENTING! INFO KODE BERIKUT
- xmenu (untuk menampilkan menu original)
- menu (untuk menampilkan menu modif )
- updatedll (untuk update script)
- restart-xray (hidupkan ulang xray)
- certv2ray / certxray (Perbarui Sertifikat / Update Certificate)


# DONASI
- ***Silahkan Donasi Seiklasnya***
<img src="https://github.com/aryobrokolly/XRAY-MPORT/blob/26495331210caf0380909a4478a7b3721e04124c/img/qris.jpg" alt="DONASI" width="350" height="470">
