#!/bin/bash

echo "=== Available Labs ==="
echo "1. Nmap Scanning Lab"
echo "2. SQL Injection Lab"
echo "0. Exit"
read -p "Enter your choice: " choice

case $choice in
  1) LAB="nmap-scan" ;;
  2) LAB="sqli" ;;
  0) echo "Goodbye!"; exit 0 ;;
  *) echo "Invalid choice."; exit 1 ;;
esac

# Download and extract the lab repo
echo "[*] Downloading $LAB..."
curl -L -o $LAB.zip https://github.com/cybersecurity-beginner-to-expert-labs/$LAB/archive/refs/heads/main.zip

unzip -q $LAB.zip
mv "$LAB-main" "$LAB"
rm -f $LAB.zip

cd $LAB
chmod +x init.sh
./init.sh
