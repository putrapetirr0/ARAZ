#!/bin/bash
# araz1308
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"

clear 
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[0;100;33m          • SYSTEM MENU •          \E[0m"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
echo -e " [\e[36m•1\e[0m] Panel Domain"
echo -e " [\e[36m•2\e[0m] Change Port All Account"
echo -e " [\e[36m•3\e[0m] Webmin Menu"
echo -e " [\e[36m•4\e[0m] Speedtest VPS"
echo -e " [\e[36m•5\e[0m] About Script"
echo -e " [\e[36m•6\e[0m] Set Auto Reboot"
echo -e " [\e[36m•7\e[0m] Restart All Service"
echo -e " [\e[36m•8\e[0m] Change Banner"
echo -e " [\e[36m•9\e[0m] Cek Bandwith"
echo -e " [\e[36m•10\e[0m] Autobackup Data VPS"
echo -e " [\e[36m•11\e[0m] Backup Data VPS"
echo -e " [\e[36m•12\e[0m] Restore Data VPS"
echo -e " [\e[36m•13\e[0m] Backup-telegram"
echo -e ""
echo -e " [\e[31m•0\e[0m] \e[31mBACK TO MENU\033[0m"
echo -e   ""
echo -e   "Press x or [ Ctrl+C ] • To-Exit"
echo -e   ""
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -p " Select menu : " opt
echo -e ""
case $opt in
1)  clear ; menu-domain ; exit ;;
2)  clear ; port-change ; exit ;;
3)  clear ; menu-webmin ; exit ;;
4)  clear ; speedtest ; exit ;;
5)  clear ; about ; exit ;;
6)  clear ; auto-reboot ; exit ;;
7)  clear ; restart ; exit ;;
8)  clear ; nano /etc/issue.net ; exit ;; #ssh-vpn banner.conf
9)  clear ; bw ; exit ;;
10) clear ; autobackup ; exit ;;
11) clear ; backup ; exit ;;
12) clear ; restore ; exit ;;
13) clear ; backup-telegram ; exit ;;
0) clear ; menu ; exit ;;
x) exit ;;
*) echo -e "" ; echo "Anda salah tekan" ; sleep 1 ; menu-set ;;
esac
