#!/bin/bash
echo ""
echo "------------------------------------ Available labs ---------------------------------"
echo "1. Nmap Scanning Lab"
echo "2. SQL Injection Lab"
echo "3. SNORT IDS Lab"
echo "0. Exit"
echo "-------------------------------------------------------------------------------------"
read -p "Enter your choice: " choice

case $choice in
  1) LAB="nmap-scan" ;;
  2) LAB="sqli" ;;
  3) LAB="snort-ids" ;;
  0) echo "Goodbye!"; exit 0 ;;
  *) echo "Invalid choice."; exit 1 ;;
esac

# Set working directory
LAB_ROOT="/home/kali/Desktop/Labs"
cd "$LAB_ROOT"

# Download and extract the lab repo
echo "[*] Downloading $LAB..."
TS=$(date +%s)
curl -L -o $LAB.zip "https://github.com/cybersecurity-beginner-to-expert-labs/$LAB/archive/refs/heads/main.zip?cache_bust=$TS"

sudo [ -d "$LAB" ] && rm -rf "$LAB"
sudo [ -d "$LAB-main" ] && rm -rf "$LAB"
unzip -q $LAB.zip
mv "$LAB-main" "$LAB"
sudo rm $LAB.zip

cd $LAB
chmod +x init.sh
sudo ./init.sh
