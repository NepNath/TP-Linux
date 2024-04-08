# TP 5 - Script ID card 


##  Objectif :

### faire un script qui récolte des ptites informations du système et qui les affiches a l'utilisateur 🗒️

script en lui même : [📁idcard.sh](idcard.sh)


<u> résultat du script :</u> (sur une vm faite a l'arrache pcq j'en avais pas sur mon pc fixe)

```bash
[nepnath@localhost srv]$ ./idcard.sh
Machine name :
0S Rocky Linux
Rocky Linux 9.3 (Blue Onyx)
cpe:/o:rocky:rocky:9::baseos and kernel version is 5.14.0-362.8.1.el9_3.x86_64
IP : 10.1.1.255
10.0.3.255
RAM : 1.4G memory available on 1.8G total memory
Disk : 4.9G space left
Top 5 processes by RAM usage :
- root         667  0.0  2.4 125168 44032 ?        Ssl  11:40   0:00 /usr/bin/python3 -s /usr/sbin/firewalld --nofork --nopid
- root         685  0.0  1.1 254816 21420 ?        Ssl  11:40   0:00 /usr/sbin/NetworkManager --no-daemon
- root           1  0.0  0.8 106216 16060 ?        Ss   11:40   0:01 /usr/lib/systemd/systemd --switched-root --system --deserialize 31
- nepnath     1241  0.0  0.7  22356 13800 ?        Ss   11:40   0:00 /usr/lib/systemd/systemd --user
- root         578  0.0  0.6  34236 12464 ?        Ss   11:40   0:00 /usr/lib/systemd/systemd-udevd
Listening ports :
        - 323 udp : chronyd
        -   : chronyd
        - 22 tcp : sshd
        -   : sshd
    - /home/nepnath/.local/bin
    - /home/nepnath/bin
    - /usr/local/bin
    - /usr/bin
    - /usr/local/sbin
    - /usr/sbin
Here is your random cat (jpg file) : https://cdn2.thecatapi.com/images/1rl.jpg
```


