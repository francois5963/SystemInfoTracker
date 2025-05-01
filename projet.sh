#!/bin/bash

HOSTNAME=$(hostname)
IP_ADDRESS=$(hostname -I | awk '{print $1}')
MAC_ADDRESS=$(ip link show | awk '/ether/ {print $2; exit}')
MEMORY_TOTAL=$(free -m | awk '/Mem:/ {print $2}')
DISK_TOTAL=$(df -h / | awk 'NR==2 {print $2}')
DATE=$(date '+%Y-%m-%d')
TIME=$(date '+%H:%M:%S')
OS_INFO=$(grep '^PRETTY_NAME' /etc/os-release | cut -d= -f2 | tr -d '"')
OS_VERSION=$(uname -r)




echo "Nom de la machine : $HOSTNAME"
echo "Adresse IP : $IP_ADDRESS"
echo "Adresse MAC : $MAC_ADDRESS"
echo "Mémoire RAM : $MEMORY_TOTAL"
echo "Espace disque : $DISK_TOTAL"
echo "Date : $DATE"
echo "Heure : $TIME"
echo "Systeme d'esploitation : $OS_INFO"
echo "Version noyau : $OS_VERSION"


cat <<EOF > infos.json
{
	"hostname" : "$HOSTNAME",
	"ip_address" : "$IP_ADDRESS",
	"mac_address" : "$MAC_ADDRESS",
	"memory_mb" : "$MEMORY_TOTAL",
	"disk_total" : "$DISK_TOTAL",
	"date" : "$DATE",
	"time" : "$TIME",
	"os_info" : "$OS_INFO",
	"os_version" : "$OS_VERSION",
}
EOF



cat <<EOF > infos.yaml
hostname: "$HOSTNAME"
ip_address: "$IP_ADDRESS"
mac_address: "$MAC_ADDRESS"
memory_mb: "$MEMORY_TOTAL"
disk_total: "$DISK_TOTAL"
date: "$DATE"
time: "$TIME"
os_info: "$OS_INFO"
os_version: "$OS_VERSION"
EOF



cat <<EOF > infos.xml
<system_info>
	<hostname>$HOSTNAME</hostname>
	<ip_address>$IP_ADDRESS</ip_address>
	<mac_address>$MAC_ADDRESS</mac_address>
	<memory_mb>$MEMORY_TOTAL</memory_mb>
	<disk_total>$DISK_TOTAL</disk_total>
	<date>$DATE</DATE>
	<time>$TIME</time>
	<os_info>$OS_INFO</os_info>
	<os_version>$OS_VERSION</os_version>
</system_info>
EOF

echo "Fichiers générés : infos.json, infos.yaml, infos.xml"



