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
date=$(date +"%Y-%m-%d");
echo
BOT_TOKEN=$(cat /home/botdet)
if [[ "$BOT_TOKEN" = "" ]]; then
echo "Please enter your bot token"
read -rp "BOT_TOKEN : " -e BOT_TOKEN
cat <<EOF>>/home/bot
$BOT_TOKEN
EOF
fi
CHAT_ID=$(cat /home/chatdet)
if [[ "$CHAT_ID" = "" ]]; then
echo "Please enter your chat id"
read -rp "CHAT_ID : " -e CHAT_ID
cat <<EOF>>/home/chat
$CHAT_ID
EOF
fi
read -n 1 -s -r -p "Press any key to back on menu"

menu
