
apt update -y && apt upgrade -y && apt install curl -y && apt install wget -y && apt install figlet -y && echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6 && apt install tmux -y && wget https://raw.githubusercontent.com/putrapetirr0/ARAZ/main/setup.sh && chmod +x setup.sh && tmux new-session -s script './setup.sh'
