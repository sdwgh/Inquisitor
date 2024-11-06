#!/bin/bash


echo -e "\e[31m"
echo " ___                   _     _ _             "
echo "|_ _|_ __   __ _ _   _(_)___(_) |_ ___  _ __"
echo " | || '_ \ / _\` | | | | / __| | __/ _ \| '__|"
echo " | || | | | (_| | |_| | \__ \ | || (_) | |   "
echo "|___|_| |_|\__, |\__,_|_|___/_|\__\___/|_|   "
echo "          |___/                             "

echo -e "\e[0m"
echo -e "\e[31m"
echo "Script Made By Sdw"
echo -e "\e[0m"
echo -e "\e[32m"
echo "Insert IP address you want to scan"
echo -e "\e[0m"


read ip_to_scan


ping -c 1 $ip_to_scan > PortsScanned.txt


if ! grep -q "1 received" PortsScanned.txt; then
    echo "The machine is not operational" 
    exit 1
fi


ttl_value=$(grep -o "ttl=[0-9]\+" PortsScanned.txt | grep -o "[0-9]\+")

if [ -n "$ttl_value" ]; then

    if ! [[ "$ttl_value" =~ ^[0-9]+$ ]]; then
        echo "The value of ttl_value is not a number: '$ttl_value'"
        exit 1
fi


    if [ "$ttl_value" -lt 65 ]; then
        echo "This is a Linux Machine"
    elif [ "$ttl_value" -lt 129 ]; then
        echo "This is a Windows Machine"
    else
        echo "Unknown OS based on TTL value"
    fi
else
    echo "TTL value not found."
fi

nmap -sS -p- --open --min-rate 5000 $ip_to_scan -n -Pn | grep -oP '\d{1,5}/tcp\s+open' >> PortsScanned.txt

cat PortsScanned.txt
