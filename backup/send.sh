#!/bin/bash
# Get date and time

IP=$(wget -qO- ipinfo.io/ip);
DATE=$(date +"%m-%d-%y")
domain=$(cat /etc/xray/domain)
######################### Colours ############################
ON_BLUE=$(echo -e "\033[44m")
RED=$(echo -e "\033[1;31m")
BLUE=$(echo -e "\033[1;34m")
GREEN=$(echo -e "\033[1;32m")
STD=$(echo -e "\033[0m") # Clear colour
##############################################################
echo "_____________________________________"
echo " "
echo "${GREEN} Title ${STD}"
echo " "
echo " ${RED} Message${STD}"
echo " "
echo "${GREEN} DATE:$DATE ${STD}"
echo "_____________________________________"
echo " "
######################## BOT INFO ############################
BOT_TOKEN=$(cat /home/bot)
CHAT_ID=$(cat /home/chat)
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
echo " ${ON_BLUE} cek file di telegram grup.... ${STD}"
