#!/bin/bash

# Fungsi untuk melihat detail akun VMess
view_vmess_account() {
    user="$1"
    
    # Menampilkan informasi akun yang sudah ada
    echo "Detail akun VMess untuk pengguna $user:"
    echo "Link TLS (Port 443):"
    cat /etc/xray/vmess/${user}_tls.json
    echo "Link Non-TLS (Port 80):"
    cat /etc/xray/vmess/${user}}_non_tls.json
    echo "UUID (Password): $(cat /etc/xray/vmess/${user}_tls.json | grep '\"id\"' | awk -F '"' '{print $4}')"
    echo "Masa Aktif Akun: 30 days"  # Disesuaikan dengan kebutuhan Anda
}

# Menampilkan header
echo "====================================="
echo "   SELAMAT DATANG DI PENGELOLA VMess"
echo "====================================="
echo

# Membersihkan layar
clear

# Menampilkan daftar pengguna VMess yang tersedia
echo "Daftar pengguna VMess yang tersedia:"
index=1
for file in /etc/xray/vmess/*_tls.json; do
    user=$(basename "${file%_tls.json}")
    echo "$index. $user"
    ((index++))
done
echo

# Meminta pengguna untuk memilih nomor pengguna
read -p "Masukkan nomor pengguna yang ingin Anda lihat detailnya: " user_number
echo

# Memilih nama pengguna berdasarkan nomor yang dimasukkan pengguna
user=$(ls /etc/v2ray/users/*_tls.json | sed -n "${user_number}p" | sed -e 's/.*\///; s/_tls.json//')

# Menampilkan detail akun VMess untuk pengguna yang dipilih
view_vmess_account "$user"

# Menampilkan footer
echo "====================================="
echo "     Terima kasih telah menggunakan layanan kami - araz1308"
echo "====================================="
