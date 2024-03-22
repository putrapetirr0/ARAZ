#!/bin/bash
# Script By Araz1308
# =========================================
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
domain=$(cat /etc/xray/domain)
NUMBER_OF_CLIENTS=$(grep -c -E "#& " "/etc/xray/config.json")
        if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
                echo -e "${RED}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
                echo -e "$BLUE ${NC}${BLUE}     ⇱ Check VLESS Config ⇲     ${NC} $BLUE $NC"
                echo -e "${RED}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
                echo ""
		echo "You have no existing clients!"
		echo ""
		echo -e "${RED}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
                read -n 1 -s -r -p "Press any key to back on menu"
        menu-vless
	fi

	echo -e "${RED}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
        echo -e "$BLUE ${NC}${BLUE}     ⇱ Check VLESS Config ⇲    ${NC} $BLUE $NC"
        echo -e "${RED}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
        echo " Select the existing client to view the config"
        echo " Press CTRL+C to return"
        echo -e "${RED}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
        echo "     No  Expired   User"
        grep -E "#& " "/etc/xray/config.json" | cut -d ' ' -f 2-3 | nl -s ') '
        until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
                if [[ ${CLIENT_NUMBER} == '1' ]]; then
                        read -rp "Select one client [1]: " CLIENT_NUMBER
                else
                        read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
                fi
        done
clear

user=$(grep -E "#& " "/etc/xray/config.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
uuid=$(grep -E "#& " "/etc/xray/config.json" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "#& " "/etc/xray/config.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
hariini=`date -d "0 days" +"%Y-%m-%d"`
vlesslink1="vless://${uuid}@${domain}:$tls?mode=gun&security=tls&encryption=none&type=grpc&serviceName=vless-grpc&sni=bug.com#${user}"
clear
clear
clear
clear
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-user.log
echo -e "\E[44;1;39m        Grpc/Vless Account        \E[0m" | tee -a /etc/log-create-user.log
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-user.log
echo -e "Remarks        : ${user}" | tee -a /etc/log-create-user.log
echo -e "Domain         : ${domain}" | tee -a /etc/log-create-user.log
echo -e "port GRPC      : $tls" | tee -a /etc/log-create-user.log
echo -e "id             : ${uuid}" | tee -a /etc/log-create-user.log
echo -e "Encryption     : none" | tee -a /etc/log-create-user.log
echo -e "Path           : vless-grpc" | tee -a /etc/log-create-user.log
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-user.log
echo -e "Link TLS       : ${vlesslink1}" | tee -a /etc/log-create-user.log
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-user.log
echo -e "Expired On     : $exp" | tee -a /etc/log-create-user.log
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-user.log
echo "" | tee -a /etc/log-create-user.log
read -n 1 -s -r -p "Press any key to back on menu"
menu-vless
