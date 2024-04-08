# TP2 - 

## FILES

🌞 Trouver le chemin vers le répertoire personnel de votre utilisateur

```bash
[nepnath@localhost ~]$ pwd
/home/nepnath
```

🌞 Trouver le chemin du fichier de logs SSH

```bash
[nepnath@localhost log]$ pwd
/var/log/
# fichier secure
```

🌞 Trouver le chemin du fichier de configuration du serveur SSH

```bash
[nepnath@localhost ssh]$ pwd
/etc/ssh
# fichier sshd_config
```

## USERS

### Nouveau User

🌞 Créer un nouvel utilisateur

```bash
[nepnath@localhost home]$ sudo useradd -m -d /home/papier_alu/ marmotte
[nepnath@localhost ~]$ sudo passwd marmotte
Changing password for user marmotte.
New password: #chocolat
BAD PASSWORD: The password fails the dictionary check - it is based on a dictionary word
Retype new password: #chocolat
passwd: all authentication tokens updated successfully.
```

### Infos enregistrées par le système

🌞 Prouver que cet utilisateur a été créé

```bash
[nepnath@localhost ~]$ sudo cat /etc/passwd | grep marmotte
marmotte:x:1001:1001::/home/marmotte:/bin/bash
```

🌞 Déterminer le hash du password de l'utilisateur marmotte

```bash
[nepnath@localhost ~]$ sudo cat /etc/shadow | grep marmotte
marmotte:$6$YM2DYTohO7tO8kr5$LaSq9kAhBj6ImrrwXRqeFYyyr94AQS2hC4a/kGRUSn4HDiCGIah5HkM6WqkZfqaFk8/0eejNyNJg2.nKhK31O1:19744:0:99999:7:::
```

### Connexion sur le nouvel utilisateur

🌞 Tapez une commande pour vous déconnecter : fermer votre session utilisateur

```bash
[nepnath@localhost home]$ exit
logout
Connection to 10.2.1.2 closed.
```

🌞 Assurez-vous que vous pouvez vous connecter en tant que l'utilisateur marmotte

```bash
PS C:\Users\nepnath> ssh marmotte@10.2.1.2
marmotte@10.2.1.2s password:
Last login: Mon Jan 22 15:33:16 2024
[marmotte@localhost ~]$ ls /home/nepnath
ls: cannot open directory '/home/nepnath': Permission denied
```

## Programmes et processus

### Run then kill

🌞 Lancer un processus sleep

```bash
[nepnath@localhost ~]$ sleep 1000
# Autre terminal
[nepnath@localhost ~]$ ps -ef | grep sleep
nepnath       1830    1812  0 15:41 pts/1    00:00:00 sleep 1000

```

🌞 Terminez le processus sleep depuis le deuxième terminal

```bash
[nepnath@localhost ~]$ kill 1830
```

### Tâche de fond

🌞 Lancer un nouveau processus sleep, mais en tâche de fond

```bash
[nepnath@localhost ~]$ sleep 1000 &
[1] 1860
```

🌞 Visualisez la commande en tâche de fond

```bash
[nepnath@localhost ~]$ ps -ef | grep sleep
nepnath       1860    1812  0 15:48 pts/1    00:00:00 sleep 1000
```

### Find paths

🌞 Trouver le chemin où est stocké le programme sleep

```bash
[nepnath@localhost bin]$ ls -al /usr/bin/ | grep sleep
-rwxr-xr-x.  1 root root   36312 Apr 24  2023 sleep
```

🌞 Tant qu'on est à chercher des chemins : trouver les chemins vers tous les fichiers qui s'appellent .bashrc

```bash
[nepnath@localhost /]$ sudo find -name .bashrc
./etc/skel/.bashrc
./root/.bashrc
./home/nepnath/.bashrc
./home/papier_alu/.bashrc
```

### La variable PATH

🌞 Vérifier que les commandes sleep, ssh, et ping sont bien des programmes stockés dans l'un des dossiers listés dans votre PATH

```bash
[nepnath@localhost /]$ echo $PATH
/home/nepnath/.local/bin:/home/nepnath/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin
[nepnath@localhost /]$ which sleep
/usr/bin/sleep
[nepnath@localhost /]$ which ssh
/usr/bin/ssh
[nepnath@localhost /]$ which ping
/usr/bin/ping
```

## Paquets

🌞 Installer le paquet git

```bash
[nepnath@localhost /]$ sudo dnf install git -y
```

🌞 Trouvez le chemin où est stocké la commande git

```bash
[nepnath@localhost /]$ which git
/usr/bin/git
```

🌞 Installer le paquet nginx

```bash
[nepnath@localhost /]$ sudo dnf install nginx -y
Complete !
```

🌞 Déterminer le chemin vers le dossier de logs de NGINX

```bash
[nepnath@localhost nginx]$ pwd
/var/log/nginx
```

🌞 Déterminer le chemin vers le dossier qui contient la configuration de NGINX

```bash
[nepnath@localhost nginx]$ pwd
/etc/nginx
```

🌞 Mais aussi déterminer...

```bash
[nepnath@localhost ~]$ cd /etc/yum.repos.d
[nepnath@localhost yum.repos.d]$ grep -nri http
```

## Poupée russe

🌞 Récupérer le fichier meow

```bash
[nepnath@localhost ~]$ sudo dnf install wget -y
[nepnath@localhost ~]$ wget https://gitlab.com/it4lik/b1-linux-2023/-/raw/master/tp/2/meow?inline=false
[nepnath@localhost ~]$ mv 'meow?inline=false' meow
```

🌞 Trouver le dossier dawa/

```bash
# ZIP
[nepnath@localhost ~]$ file meow
meow: Zip archive data, at least v2.0 to extract
[nepnath@localhost ~]$ mv meow meow.zip
[nepnath@localhost ~]$ sudo dnf install unzip
[nepnath@localhost ~]$ sudo unzip meow.zip
Archive:  meow.zip
  inflating: meow
# XZ
[nepnath@localhost ~]$ file meow
meow: XZ compressed data
[nepnath@localhost ~]$ mv meow meow.xz
[nepnath@localhost ~]$ sudo unxz meow.xz
# BZIP2
[nepnath@localhost ~]$ file meow
meow: bzip2 compressed data, block size = 900k
[nepnath@localhost ~]$ sudo dnf install bzip2
[nepnath@localhost ~]$ mv meow meow.bz2
[nepnath@localhost ~]$ bzip2 -d meow.bz2
# RAR
[nepnath@localhost ~]$ file meow
meow: RAR archive data, v5
[nepnath@localhost ~]$ sudo mv meow meow.rar
[nepnath@localhost ~]$ sudo dnf install https://download1.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-8.noarch.rpm
[nepnath@localhost ~]$ sudo dnf install unrar
[nepnath@localhost ~]$ sudo unrar e meow.rar
# GZIP
[nepnath@localhost ~]$ file meow
meow: gzip compressed data, from Unix, original size modulo 2^32 145049600
[nepnath@localhost ~]$ mv meow meow.gz
[nepnath@localhost ~]$ sudo gunzip meow.gz
# TAR
[nepnath@localhost ~]$ file meow
meow: POSIX tar archive (GNU)
[nepnath@localhost ~]$ mv meow meow.tar
[nepnath@localhost ~]$ sudo dnf install tar -y
[nepnath@localhost ~]$ tar -xf meow.tar
```

🌞 Dans le dossier dawa/, déterminer le chemin vers

- le seul fichier de 15Mo

```bash
[nepnath@localhost dawa]$ find -size 15M
./folder31/19/file39
```

- le seul fichier qui ne contient que des 7

```bash
[nepnath@localhost dawa]$ grep "777777" -r
folder43/38/file41:77777777777
```

- le seul fichier qui est nommé cookie

```bash
[nepnath@localhost dawa]$ find -type f -name cookie
./folder14/25/cookie
```

- le seul fichier caché (un fichier caché c'est juste un fichier dont le nom commence par un .)

```bash
[nepnath@localhost dawa]$ find -type f -name ".*"
./folder32/14/.hidden_file
```

- le seul fichier qui date de 2014

```bash
[nepnath@localhost dawa]$ find -type f -newermt 2014-01-01 ! -newermt 2015-01-01
./folder36/40/file43
```

- le seul fichier qui a 5 dossiers-parents

```bash
[nepnath@localhost dawa]$ find -type f -path "*/*/*/*/*/*/*" 
./folder37/45/23/43/54/file43
```

