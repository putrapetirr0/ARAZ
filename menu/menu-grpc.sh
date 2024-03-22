#!/bin/bash
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"

clear 
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[0;100;33m      • Grpc MENU •          \E[0m"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
echo -e " [\e[36m•1\e[0m] Create Account grpc vmess "
echo -e " [\e[36m•2\e[0m] Create Account grpc vless "
echo -e " [\e[36m•3\e[0m] Create Account grpc trojan "
echo -e " [\e[36m•4\e[0m] Renew grpc vmess "
echo -e " [\e[36m•5\e[0m] Renew grpc vless "
echo -e " [\e[36m•6\e[0m] Renew grpc trojan "
echo -e " [\e[36m•7\e[0m] Delete grpc vmess "
echo -e " [\e[36m•8\e[0m] Delete grpc vless "
echo -e " [\e[36m•9\e[0m] Delete grpc trojan "
echo -e " [\e[36m•10\e[0m] Detail Account grpc vmess "
echo -e " [\e[36m•11\e[0m] Detail Account grpc vless "
echo -e " [\e[36m•12\e[0m] Detail Account grpc trojan "
echo -e ""
echo -e " [\e[31m•0\e[0m] \e[31mBACK TO MENU\033[0m"
echo -e   ""
echo -e   "Press x or [ Ctrl+C ] • To-Exit"
echo ""
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -p " Select menu : " opt
echo -e ""
case $opt in
1) clear ; add-ws-grpc ;;
2) clear ; add-vless-grpc ;;
3) clear ; add-tr-grpc ;;
4) clear ; renew-ws-gr ;;
5) clear ; renew-vless-gr ;;
6) clear ; renew-tr-gr ;;
7) clear ; del-ws-grpc ;;
8) clear ; del-vless-grpc ;;
9) clear ; del-tr-grpc ;;
10) clear ; mem-ws-grpc ;;
11) clear ; mem-vless-grpc ;;
12) clear ; mem-tr-grpc ;;
0) clear ; menu ;;
x) exit ;;
*) echo "salah tekan" ; sleep 1 ; menu-trojan ;;
esac
