#!/bin/bash
# Get date and time

IP=$(wget -qO- ipinfo.io/ip);
DATE=$(date +"%m-%d-%y")
domain=$(cat /root/domain)
######################### Colours ############################
ON_BLUE=$(echo -e "\033[44m")
RED=$(echo -e "\033[1;31m")
BLUE=$(echo -e "\033[1;34m")
GREEN=$(echo -e "\033[1;32m")
STD=$(echo -e "\033[0m") # Clear colour
######################## BOT INFO ############################
BOT_TOKEN=$(sed '/^$/d' /home/bot)
CHAT_ID=$(sed '/^$/d' /home/chat)
file_path=""
 
# Function to send a file to Telegram
send_file() {
 local file_path="$1"
 local caption="$2"
 curl -s -X POST "https://api.telegram.org/bot$BOT_TOKEN/sendDocument" \
 -F "chat_id=$CHAT_ID" \
 -F "document=@$file_path" \
 -F "caption=$caption"
}
send_file "$1" "Assalamualaikum 
kawanku saya kirimkan file backup
Detail Backup 
======================
Tanggal Backup : $DATE
======================
Your IP VPS : $IP
Domain      : $domain
======================
Terima kasih
Ingat harus sedekah!!!!
waalaikumsalam wr wb " > /dev/null
clear
echo " ${ON_BLUE} cek file di telegram grup.... ${STD}"
