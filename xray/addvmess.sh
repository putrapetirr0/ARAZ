#!/bin/bash

# Fungsi untuk melihat detail akun VMess
view_vmess_account() {
    user="$1"
    
    # Mendapatkan detail akun VMess dari file konfigurasi
    vmess_config="/etc/xray/vmess"
    if [[ -f "$vmess_config" ]]; then
        detail=$(grep -E "^$user:" "$vmess_config")
        if [[ -n "$detail" ]]; then
            username=$(echo "$detail" | cut -d ':' -f 1)
            uuid=$(echo "$detail" | cut -d ':' -f 2)
            port=$(echo "$detail" | cut -d ':' -f 3)
            expired_date=$(echo "$detail" | cut -d ':' -f 4)
            link_non_tls="vmess://$uuid@$your_server_ip:$port?security=none&type=ws&host=$your_domain&path=/vmess&tls=none"
            link_tls="vmess://$uuid@$your_server_ip:$port?security=auto&type=ws&host=$your_domain&path=/vmess&tls=TLS"
            link_grpc="vmess://$uuid@$your_server_ip:$port?type=grpc&security=auto&host=$your_domain"
            
            echo "Detail akun VMess untuk user: $username"
            echo "=========================================="
            echo "User: $username"
            echo "UUID: $uuid"
            echo "Port: $port"
            echo "Expired Date: $expired_date"
            echo "Link untuk VMess (Non-TLS): $link_non_tls"
            echo "Link untuk VMess (TLS): $link_tls"
            echo "Link untuk VMess (gRPC): $link_grpc"
        else
            echo "User $user tidak ditemukan."
        fi
    else
        echo "File konfigurasi VMess tidak ditemukan di $vmess_config"
    fi
}

# Meminta input dari pengguna
read -p "Masukkan username akun VMess: " user

# Melihat detail akun VMess dengan fungsi yang telah ditentukan
view_vmess_account "$user"
