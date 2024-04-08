#!/bin/bash
# NepNath
#16/03/2024

name=$(hostnamectl --static)
os_name=$(cat /etc/os-release | grep NAME | cut -d'"' -f2)
kernel_ver=$(uname -r)
ip=$(ip a | grep inet | grep enp0s | cut -d ' ' -f8)
ram_total=$( free -h --giga | grep Mem: | tr -s ' ' | cut -d '/' -f1 | cut -d ' ' -f2)
ram_available=$( free -h --giga | grep Mem: | tr -s ' ' | cut -d ' ' -f4)
storage=$(df -h / | grep / | tr -s '[:space:]' | cut -d' ' -f4)
process=$(ps aux --sort=-%mem | tail -n +2 | head -n 5)
kitr=$(curl -s https://api.thecatapi.com/v1/images/search | cut -d '"' -f8)

echo "Machine name : $name"
echo "0S $os_name and kernel version is $kernel_ver"
echo "IP : $ip"
echo "RAM : $ram_available memory available on $ram_total total memory"
echo "Disk : $storage space left"
echo "Top 5 processes by RAM usage :"
echo "$process" | sed 's/^/- /'
echo "Listening ports :"
ss -tulne | tail -n+2 | while read ss; do
    port=$(echo "$ss" | tr -s ' ' | cut -d ' ' -f5 | grep -v "::" | cut -d ":" -f2)
    protocol=$( echo "$ss" | tr -s ' ' | grep -v "::" | cut -d ' ' -f1)
    program=$(echo "$ss" | tr -s ' ' | cut -d ' ' -f9 | cut -d '/' -f3 | cut -d '.' -f1)
    echo "      - $port $protocol : $program"
done
echo "$PATH" | tr ':' '\n' | while read -r directory; do
    echo "  - $directory"
done
echo "Here is your random cat (jpg file) : "
ascii-image-converter  -m " =+#@" -C -f $kitr