#!/bin/bash

# Fungsi untuk melihat detail akun VMess
view_vmess_account() {
    local user="$1"
    
    # Mendapatkan detail akun VMess dari file konfigurasi
    local vmess_config="/etc/xray/config.json"
    if [[ -f "$vmess_config" ]]; then
        local username=$(jq -r ".inbounds[0].settings.clients | map(select(.id == \"$user\")) | .[0].email" "$vmess_config")
        local uuid=$(jq -r ".inbounds[0].settings.clients | map(select(.id == \"$user\")) | .[0].id" "$vmess_config")
        local port=$(jq -r '.inbounds[0].port' "$vmess_config")
        
        if [[ -n "$username" && -n "$uuid" && -n "$port" ]]; then
            echo "Detail akun VMess untuk user: $username"
            echo "=========================================="
            echo "User: $username"
            echo "UUID: $uuid"
            echo "Port: $port"
        else
            echo "User $user tidak ditemukan."
        fi
    else
        echo "File konfigurasi VMess tidak ditemukan di $vmess_config"
    fi
}

# Menampilkan daftar username dengan nomor
echo "Daftar Username Akun VMess:"
echo "============================"
usernames=($(jq -r '.inbounds[0].settings.clients[].email' "/etc/xray/config.json"))
for i in "${!usernames[@]}"; do
    echo "$(($i + 1)). ${usernames[$i]}"
done
echo "============================"

# Meminta input nomor dari pengguna
read -p "Masukkan nomor akun VMess untuk melihat detailnya: " choice

# Validasi pilihan pengguna
if [[ $choice =~ ^[0-9]+$ ]]; then
    index=$(($choice - 1))
    if [[ $index -ge 0 && $index -lt ${#usernames[@]} ]]; then
        username="${usernames[$index]}"
        view_vmess_account "$username"
    else
        echo "Nomor yang dimasukkan tidak valid."
    fi
else
    echo "Nomor yang dimasukkan tidak valid."
fi
