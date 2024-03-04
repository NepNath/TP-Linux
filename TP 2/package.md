# Partie 2 : Programmes et paquets

# I. Programmes et processus

➜ Dans cette partie, afin d'avoir quelque chose à étudier, on va utiliser le programme `sleep`

- c'est une commande (= un programme) dispo sur tous les OS
- ça permet de... ne rien faire pendant X secondes
- la syntaxe c'est `sleep 90` pour attendre 90 secondes
- on s'en fout de `sleep` en doit, c'est une commande utile parmi plein d'autres, elle est pratique pour étudier les trucs que j'veux vous montrer

## 1. Run then kill

🌞 **Lancer un processus `sleep`**

- il doit dormir 1000 secondes
- ouvrez un deuxième terminal, pendant que le premier est occupé par le `sleep`
- dans ce deuxième terminal, déterminer le PID du processus `sleep`
- il existe une commande qui permet de lister les processus en cours d'exécution (un gestionnaire des tâches quoi)
- syntaxe `commande | grep xxx` pour afficher uniquement la ligne du `sleep`

```bash 
ps -aux | grep sleep
```

Le PID est le nombre qui vient généralement après le nom de l'utilisateur qui a lancé le process

> Le *PID* pour *Process IDentifier* c'est un ID unique attribué à chaque process lancé. Chaque processus, on lui attribue un numéro quoi.

🌞 **Terminez le processus `sleep` depuis le deuxième terminal**

- utilisez la commande `kill` pour arrêter le processus `sleep`

> Utiliser la commande `kill` revient à appuyer sur la croix rouge en haut d'une fenêtre pour fermer un programme.

```bash
kill PID
```
(dans mon cas)
```bash
kill 3319
```

## 2. Tâche de fond

🌞 **Lancer un nouveau processus `sleep`, mais en tâche de fond**

- il doit dormir 1000 secondes
- pour lancer une commande en tâche de fond, il faut ajouter `&` à la fin de la commande
- ainsi, on garde notre terminal actif pendant que le programme s'exécute

🌞 **Visualisez la commande en tâche de fond**

- il existe une commande pour lister les processus qu'on a lancé en tâche de fond
- en utilisant cette commande, récupérez le PID du processus sleep

## 3. Find paths

➜ La commande `sleep`, comme toutes les commandes, c'est un programme

- sous Linux, on met pas l'extension `.exe`, s'il y a pas d'extensions, c'est que c'est un exécutable généralement

🌞 **Trouver le chemin où est stocké le programme `sleep`**

- je veux voir un `ls -al /chemin | grep sleep` dans le rendu

🌞 Tant qu'on est à chercher des chemins : **trouver les chemins vers tous les fichiers qui s'appellent `.bashrc`**

- utilisez la commande `find`
- `find` s'utilise comme suit : `find CHEMIN -name NAME`
  - `CHEMIN` c'est un chemin vers un dossier : `find` va chercher des fichiers qui sont contenus dans ce dossier
  - `NAME` est le nom du fichier qu'on cherche

➜ `find` est une commande de ouf qui permet de trouver des fichiers ou dossiers selon plein de critères

```bash
# quelques exemples d'utilisation de find

# trouver tous les .jpg sur tout le disque dur
$ sudo find / -name "*.jpg"

# trouver tous les .jpg sur tout le disque dur, s'ils font + de 10Mo
$ sudo find / -name "./jpg" -size +10M

# c'est un tout ptit aperçu, un peut chercher en fonction de plein plein de critères, et c'est hyper rapide
```

## 4. La variable PATH

**Sur tous les OS (MacOS, Windows, Linux, et autres) il existe une variable `PATH` qui est définie quand l'OS démarre.** Elle est accessible par toutes les applications qui seront lancées sur cette machine.

**On dit que `PATH` est une variable d'environnement.** C'est une variable définie par l'OS, et accessible par tous les programmes.

> *Il existe plein de variables d'environnement définie dès que l'OS démarre, `PATH` n'est pas la seule. On peut aussi en créer autant qu'on veut. Attention, suivant avec quel utilisateur on se connecte à une machine, les variables peuvent être différentes : parfait pour avoir chacun sa configuration !*

**`PATH` contient la liste de tous les dossiers qui contiennent des commandes/programmes.**

Ainsi quand on tape une commande comme `ls /home`, il se passe les choses suivantes :

- votre terminal consulte la valeur de la variable `PATH`
- parmi tous les dossiers listés dans cette variable, il cherche s'il y en a un qui contient un programme nommé `ls`
- si oui, il l'exécute
- sinon : `command not found`

Démonstration :

```bash
# on peut afficher la valeur de la variable PATH à n'importe quel moment dans un terminal
$ echo $PATH
/usr/local/sbin:/usr/local/bin:/usr/bin:/bin
# ça contient bien une liste de dossiers, séparés par le caractère ":"

# si la commande ls fonctionne c'est forcément qu'elle se trouve dans l'un de ces dossiers
# on peut savoir lequel avec la commande which qui interroge aussi la variable PATH
$ which ls
/usr/bin/ls
```

🌞 **Vérifier que**

- les commandes `sleep`, `ssh`, et `ping` sont bien des programmes stockés dans l'un des dossiers listés dans votre `PATH`

# II. Paquets

➜ **Tous les OS Linux sont munis d'un store d'application**

- c'est natif
- quand tu fais `apt install` ou `dnf install`, ce genre de commandes, t'utilises ce store
- on dit que `apt` et `dnf` sont des gestionnaires de paquets
- ça permet aux utilisateurs de télécharger des nouveaux programmes (ou d'autres trucs) depuis un endroit safe

🌞 **Installer le paquet `firefox`**

- c'est uste pour faire pratiquer
- si vous avez choisi un OS sans interface graphique, inutile de télécharger Firefox
  - sans interface graphique, vous pouvez installer le paquet `git` pour remplacer

🌞 **Utiliser une commande pour lancer Firefox**

- comme d'hab, une commande, c'est un programme hein
- déterminer le chemin vers le programme `firefox`
- sans interface graphique, même exercice avec `git` : trouvez le chemin où est stocké la commande

🌞 **Installer le paquet `nginx`**

- il faut utiliser le gestionnaire de paquet natif à l'OS que tu as choisi
- si c'est un système...
  - basé sur Debian, comme Debian lui-même, ou Ubuntu, ou Kali, ou d'autres, c'est `apt` qui est fourni
  - basé sur RedHat, comme Rocky, Fedora, ou autres, c'est `dnf` qui est fourni

🌞 **Déterminer**

- le chemin vers le dossier de logs de NGINX
- le chemin vers le dossier qui contient la configuration de NGINX

🌞 **Mais aussi déterminer...**

- l'adresse `http` ou `https` des serveurs où vous téléchargez des paquets
- une commande `apt install` ou `dnf install` permet juste de faire un téléchargement HTTP
- ma question c'est donc : sur quel(les) URL(s) tu te connectes pour télécharger des paquets
- il existe un dossier qui contient la liste des URLs consultées quand vous demandez un téléchargement de paquets
