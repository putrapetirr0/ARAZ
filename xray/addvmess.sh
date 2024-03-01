#!/bin/bash

# Fungsi untuk menghasilkan UUID acak
generate_uuid() {
    cat /proc/sys/kernel/random/uuid
}

# Fungsi untuk membuat akun VMess dengan dua link
create_vmess_account() {
    username="$1"
    uuid=$(generate_uuid)  # Menghasilkan UUID acak
    server_ip=$(hostname -I | awk '{print $1}') # Mengambil alamat IP dari sistem Linux
    domain=$(hostname) # Mengambil nama host (domain) dari sistem Linux
    account_duration="30 days"  # Masa aktif akun dalam format "x days"

    # Membuat konfigurasi pengguna VMess untuk link TLS (port 443)
    cat > /etc/v2ray/users/${username}_tls.json << EOF
{
  "v": "2",
  "ps": "$username (TLS)",
  "add": "$server_ip",
  "port": 443,
  "id": "$uuid",
  "aid": 64,
  "net": "tcp",
  "type": "http",
  "host": "$domain",
  "path": "/$username",
  "tls": "tls"
}
EOF

    # Membuat konfigurasi pengguna VMess untuk link non-TLS (port 80)
    cat > /etc/v2ray/users/${username}_non_tls.json << EOF
{
  "v": "2",
  "ps": "$username (Non-TLS)",
  "add": "$server_ip",
  "port": 80,
  "id": "$uuid",
  "aid": 64,
  "net": "tcp",
  "type": "http",
  "host": "$domain",
  "path": "/$username",
  "tls": ""
}
EOF

    # Restart V2Ray
    systemctl restart v2ray

    # Menampilkan informasi akun yang dibuat
    echo "Akun VMess berhasil dibuat untuk pengguna $username:"
    echo "Link TLS: vmess://$(cat /etc/v2ray/users/${username}_tls.json | base64 -w 0)"
    echo "Link Non-TLS: vmess://$(cat /etc/v2ray/users/${username}_non_tls.json | base64 -w 0)"
    echo "Username: $username"
    echo "UUID (Password): $uuid"
    echo "Alamat IP Server: $server_ip"
    echo "Domain: $domain"
    echo "Masa Aktif Akun: $account_duration"
}

# Menjalankan fungsi untuk membuat akun VMess
create_vmess_account "user1"
