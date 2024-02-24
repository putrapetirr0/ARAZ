#!/bin/bash
# My Telegram : https://t.me/araz1308
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
domen=$(sed '/^$/d' /home/dom)
rm -rf /home/$domen
clear
if [[ "$domen" = "" ]]; then
echo "Please enter your domain"
read -rp "domen : " -e domen
cat <<EOF>>/home/dom
$domen
EOF
fi
echo
knockpy $domen -o /home/$domen
cd /home
zip -r $domen.zip $domen > /dev/null 2>&1
######################## BOT INFO ############################
BOT_TOKEN=$(sed '/^$/d' /home/botdet)
CHAT_ID=$(sed '/^$/d' /home/chatdet)
file_path=""
 
# Function to send a file to Telegram
send_file() {
 local file_path="$domen.zip"
 local caption="$2"
 curl -s -X POST "https://api.telegram.org/bot$BOT_TOKEN/sendDocument" \
 -F "chat_id=$CHAT_ID" \
 -F "document=@$file_path" \
 -F "caption=$caption"
}
send_file "$domen.zip" "Assalamualaikum 
kawanku saya kirimkan file hasil pencarianku"
rm -rf /home/dom
rm -r /home/$domen
rm -r /home/$domen.zip
clear
echo " ${ON_BLUE} cek file di telegram grup.... ${STD}"
clear
