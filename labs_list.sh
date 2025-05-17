#!/bin/bash

echo "=== Available Labs ==="
echo "1. Nmap Scanning Lab"
echo "2. SQL Injection Lab"
echo "0. Exit"
read -p "Enter your choice: " choice

case $choice in
  1) LAB="lab1-nmap-scan" ;;
  2) LAB="lab2-sqli" ;;
  0) echo "Goodbye!"; exit 0 ;;
  *) echo "Invalid choice."; exit 1 ;;
esac

# Download and extract only the selected lab
echo "[*] Downloading $LAB..."
curl -L -o $LAB.zip https://github.com/YOUR_USERNAME/cyber-labs/archive/refs/heads/main.zip

unzip -q $LAB.zip "cyber-labs-main/labs/$LAB/*"
mv cyber-labs-main/labs/$LAB ./
rm -rf cyber-labs-main $LAB.zip

cd $LAB
chmod +x init.sh
./init.sh