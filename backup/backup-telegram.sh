#!/bin/bash
# SL
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
clear
IP=$(wget -qO- ipinfo.io/ip);
date=$(date +"%Y-%m-%d")
clear
echo "Mohon Menunggu , Proses Backup sedang berlangsung !!"
rm -rf /root/backup
mkdir /root/backup
cp /etc/passwd backup/
cp /etc/group backup/
cp /etc/shadow backup/
cp /etc/gshadow backup/
cp -r /etc/wireguard backup/wireguard
cp /etc/ppp/chap-secrets backup/chap-secrets
#cp /etc/ipsec.d/passwd backup/passwd1
#cp /etc/shadowsocks-libev/akun.conf backup/ss.conf
#cp -r /var/lib/crot/ backup/crot
#cp -r /home/sstp backup/sstp
cp -r /etc/xray backup/xray
cp -r /etc/xray backup/v2ray
#cp -r /root/nsdomain backup/nsdomain
#cp -r /etc/slowdns backup/slowdns
cp -r /etc/trojan-go backup/trojan-go
#cp -r /usr/local/shadowsocksr/ backup/shadowsocksr
cp -r /home/vps/public_html backup/public_html
cd /root
zip -r $IP.zip backup > /dev/null 2>&1
bash backup.sh $IP.zip
Detail Backup 
==================================
IP VPS        : $IP
Tanggal       : $date
==================================
