#!/bin/bash
#installer Websocker

cd

#Install Script Websocket-SSH Python
wget -O /usr/local/bin/ws-openssh https://raw.githubusercontent.com/putrapetirr0/ARAZ/main/sshws/openssh-socket.py 
wget -O /usr/local/bin/ws-dropbear https://raw.githubusercontent.com/putrapetirr0/ARAZ/main/sshws/dropbear-ws.py 
wget -O /usr/local/bin/ws-stunnel https://raw.githubusercontent.com/putrapetirr0/ARAZ/main/sshws/ws-stunnel 
wget -O /usr/local/bin/ws-ovpn https://raw.githubusercontent.com/putrapetirr0/ARAZ/main/sshws/ws-ovpn.py 
wget -O /usr/local/bin/ws-nontls https://raw.githubusercontent.com/putrapetirr0/ARAZ/main/sshws/websocket.py 
wget -O /usr/local/bin/ws-tls https://raw.githubusercontent.com/putrapetirr0/ARAZ/main/sshws/ws-tls
wget -O /usr/local/bin/x-tls https://raw.githubusercontent.com/putrapetirr0/ARAZ/main/sshws/x-tls

#izin permision
chmod +x /usr/local/bin/ws-openssh
chmod +x /usr/local/bin/ws-dropbear
chmod +x /usr/local/bin/ws-stunnel
chmod +x /usr/local/bin/ws-ovpn
chmod +x /usr/local/bin/ws-nontls
chmod +x /usr/local/bin/ws-tls
chmod +x /usr/local/bin/x-tls

#System OpenSSH Websocket-SSH Python
wget -O /etc/systemd/system/ws-openssh.service https://raw.githubusercontent.com/putrapetirr0/ARAZ/main/sshws/service-wsopenssh && chmod +x /etc/systemd/system/ws-openssh.service

#System Dropbear Websocket-SSH Python
wget -O /etc/systemd/system/ws-dropbear.service https://raw.githubusercontent.com/putrapetirr0/ARAZ/main/sshws/service-wsdropbear && chmod +x /etc/systemd/system/ws-dropbear.service

#System SSL/TLS Websocket-SSH Python
wget -O /etc/systemd/system/ws-stunnel.service https://raw.githubusercontent.com/putrapetirr0/ARAZ/main/sshws/ws-stunnel.service && chmod +x /etc/systemd/system/ws-stunnel.service

#System Websocket-OpenVPN Python
wget -O /etc/systemd/system/ws-ovpn.service https://raw.githubusercontent.com/putrapetirr0/ARAZ/main/sshws/ws-ovpn.service && chmod +x /etc/systemd/system/ws-ovpn.service

#System Websocket-nontls Python
wget -O /etc/systemd/system/ws-nontls.service https://raw.githubusercontent.com/putrapetirr0/ARAZ/main/sshws/ws-nontls.service && chmod +x /etc/systemd/system/ws-nontls.service

#System Websocket-tls Python
wget -O /etc/systemd/system/ws-tls.service https://raw.githubusercontent.com/putrapetirr0/ARAZ/main/sshws/ws-tls.service && chmod +x /etc/systemd/system/ws-tls.service

#System Websocket-tls Python
wget -O /etc/systemd/system/x-tls.service https://raw.githubusercontent.com/putrapetirr0/ARAZ/main/sshws/x-tls.service && chmod +x /etc/systemd/system/x-tls.service

#restart service
systemctl daemon-reload
Enable & Start & Restart ws-openssh service
systemctl enable ws-openssh.service
systemctl start ws-openssh.service
systemctl restart ws-openssh.service

#Enable & Start & Restart ws-dropbear service
systemctl enable ws-dropbear.service
systemctl start ws-dropbear.service
systemctl restart ws-dropbear.service

#Enable & Start & Restart ws-openssh service
systemctl enable ws-stunnel.service
systemctl start ws-stunnel.service
systemctl restart ws-stunnel.service

#Enable & Start ws-ovpn service
systemctl enable ws-ovpn.service
systemctl start ws-ovpn.service
systemctl restart ws-ovpn.service

#Enable & Start ws-nontls.service
systemctl enable ws-nontls.service
systemctl start ws-nontls.service
systemctl restart ws-nontls.service

#Enable & Start ws-tls.service
systemctl enable ws-tls.service
systemctl start ws-tls.service
systemctl restart ws-tls.service

#Enable & Start x-tls.service
systemctl enable x-tls.service
systemctl start x-tls.service
systemctl restart x-tls.service


