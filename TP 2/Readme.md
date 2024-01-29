# Readme du TP 2 

# I. Fichiers

**🌞 Trouver le chemin vers le répertoire personnel de votre utilisateur**

dès qu'on ouvre le terminal on est dans ce fameux répertoire personnel, on peut le trouver avec la commande pwd

```
[nepnath@localhost ~]$ pwd
/home/nepnath
```

**🌞 Trouver le chemin du fichier de logs SSH**
* il existe un fichier texte, un fichier de log, qui enregistre toutes les tentatives de connexion en SSH (réussies ou échouées)
* on peut donc facilement voir dans ce fichier qui a essayé de se connecter à notre machine
* la plupart des programmes (y compris le serveur SSH) font ça : écrire dans un fichier txt tout ce qui est effectué
  * permet de garder une trace, de comprendre ce qu'il se passe quand ça va mal, toussa
* dans les OS Linux, il existe un dossier dédié qui contient tous les fichiers de logs

alors je n'ai pas trouvé de fichier de log SSH, mais j'ai trouvé un fichier de log qui contient des infos sur les connexions SSH, il est situé dans /var/log/secure

```
[nepnath@localhost ~]$ cd /var/log
[nepnath@localhost log]$ cat secure
```

**🌞 Trouver le chemin du fichier de configuration du serveur SSH**

le fichier de configuration du serveur SSH est situé dans /etc/ssh/sshd_config

```
[nepnath@localhost log]$ cd /etc/ssh
[nepnath@localhost ssh]$ cat sshd_config
```


# II. Users

## 1. Nouveau user

🌞 **Créer un nouvel utilisateur**

- il doit s'appeler `marmotte`
- son password doit être `chocolat`
- son répertoire personnel doit être le dossier `/home/papier_alu/`

```
[nepnath@localhost ~]$ sudo useradd -m -d /home/papier_alu/ -p chocolat marmotte
```


## 2. Infos enregistrées par le système

➜ **Pour le compte-rendu**, et pour vous habituer à **utiliser le terminal de façon pratique**, petit hint :

```bash
# supposons un fichier "nul.txt", on peut afficher son contenu avec la commande :
$ cat /chemin/vers/nul.txt
salut
à
toi

# il est possible en une seule ligne de commande d'afficher uniquement une ligne qui contient un mot donné :
$ cat /chemin/vers/nul.txt | grep salut
salut

# à l'aide de `| grep xxx`, on a filtré la sortie de la commande cat
# ça n'affiche donc que la ligne qui contient le mot demandé : "salut"
```

🌞 **Prouver que cet utilisateur a été créé**


```bash 
sudo cat /etc/passwd | grep marmotte
```



🌞 **Déterminer le *hash* du password de l'utilisateur `marmotte`**

```bash
sudo cat /etc/shadow | grep marmotte

```

> **On ne stocke JAMAIS le mot de passe des utilisateurs** (sous Linux, ou ailleurs) mais **on stocke les *hash* des mots de passe des users.** Un *hash* c'est un dérivé d'un mot de passe utilisateur : il permet de vérifier à l'avenir que le user tape le bon password, mais sans l'avoir stocké ! On verra ça une autre fois en détails.

## 3. Hint sur la ligne de commande

> *Ce qui est dit dans cette partie est valable pour tous les OS.*

**Quand on donne le chemin d'un fichier à une commande, on peut utiliser soit un *chemin relatif*, soit un *chemin absolu* :**

➜ **chemin absolu**

- c'est le chemin complet vers le fichier
  - il commence forcément par `/` sous Linux ou MacOS
  - il commence forcément par `C:/` (ou une autre lettre) sous Windows
- peu importe où on l'utilise, ça marche tout le temps
- par exemple :
  - `/etc/ssh/sshd_config` est un chemin absolu
  - *et c'est le chemin vers le fichier de conf du serveur SSH sous Linux en l'occurrence*
- mais parfois c'est super long et chiant à taper/utiliser donc on peut utiliser...

➜ ... un **chemin relatif**

- on écrit pas le chemin en entier, mais uniquement le chemin depuis le dossier où se trouve
- par exemple :
  - si on se trouve dans le dossier `/etc/ssh/`
  - on peut utiliser `./sshd_config` : c'est le chemin relatif de `sshd_config` quand on se trouve dans `/etc/ssh/`
  - un chemin relatif commence toujours par un `.`
  - `.` c'est "le dossier actuel"

➜ **Exemples :**

```bash
# on se déplace dans un répertoire spécifique, ici le répertoire personnel du user it4
$ cd /home/it4

# on affiche (parce que pourquoi pas) le fichier de conf du serveur SSH
# en utilisant le chemin absolu du fichier
$ cat /etc/ssh/sshd_config
[...] # ça fonctionne

# cette fois chemin relatif ???
$ cat ./sshd_config
cat: sshd_config: No such file or directory
# on a une erreur car le fichier "sshd_config" n'existe pas dans "/home/it4"

# on se déplace dans le bon dossier
$ cd /etc/ssh

# et là
$ cat ./sshd_config
[...] # ça fonctionne

# en vrai pour permettre d'aller plus vite, ça marche aussi si on met pas le ./ au début
$ cat sshd_config
[...] # ça fonctionne
```

## 3. Connexion sur le nouvel utilisateur

🌞 **Tapez une commande pour vous déconnecter : fermer votre session utilisateur**

```bash
sudo pkill -u marmotte
```
(j'ai mis marotte mais ça marche avec tout les noms d'utilsiateurs)

🌞 **Assurez-vous que vous pouvez vous connecter en tant que l'utilisateur `marmotte`**

- une fois connecté sur l'utilisateur `marmotte`, essayez de faire un `ls` dans le répertoire personnel de votre premier utilisateur
- assurez-vous que vous mangez un beau `Permission denied` : vous avez pas le droit de regarder dans les répertoires qui vous concernent pas

> **On verra en détails la gestion des droits très vite.**