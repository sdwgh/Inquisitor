#!/bin/bash

# Display the header
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

# Read the IP address from user input
read ip_to_scan

# Perform a ping to the specified IP address
ping -c 1 $ip_to_scan > PortsScanned.txt

# Check if the ping was successful
if ! grep -q "1 received" PortsScanned.txt; then
    echo "The machine is not operational" 
    exit 1
fi

# Extract the TTL value from the ping result
ttl_value=$(grep -o "ttl=[0-9]\+" PortsScanned.txt | grep -o "[0-9]\+")

if [ -n "$ttl_value" ]; then
    # Check if ttl_value is a number
    if ! [[ "$ttl_value" =~ ^[0-9]+$ ]]; then
        echo "The value of ttl_value is not a number: '$ttl_value'"
        exit 1
fi

    # Determine the operating system based on the TTL value
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

nmap -sS -p- --open --min-rate 5000 $ip_to_scan -n -Pn | grep -oP '\d{1,5}/tcp\s+ope>

cat PortsScanned.txt
