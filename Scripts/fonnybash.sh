#!/bin/bash

    echo "Hostname: $(hostname)"
    echo "Information about this machine : "
    cat  /etc/os-release | head -n 3
    
    echo "Machine name : $(hostname)"
    echo "OS : $(cat /etc/os-release | head -n 1 | cut -d '"' -f 2) and kernel version is $(uname -r)"
    echo "IP : $(ip a | head -n 9 | tail -n 1 | cut -c 1-20)" #pas correcte faut récupérer l'ip et pas la cut dans ip a
    echo "Top 5 processes by RAM usage :"
    ps aux --sort=-%mem | head -5 | cut -c 1-66 
    echo "Disk : $(df / -h | tail -1 | cut -c 33-39) space left"



# $ /srv/idcard/idcard.sh
# Machine name : ...
# OS ... and kernel version is ...
# IP : ...
# RAM : ... memory available on ... total memory
# Disk : ... space left
# Top 5 processes by RAM usage :
#   - python3
#   - NetworkManager
#   - systemd
#   - ...
#   - ...
# Listening ports :
#   - 22 tcp : sshd
#   - ...
#   - ...
# PATH directories :
#   - /usr/local/bin
#   - ...
#   - ...

# Here is your random cat (jpg file) : https://....
