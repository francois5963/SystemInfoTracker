# SystemInfoTracker

#Installation Machine virtuelle

1. J'ai installer une machine virtuelle Windows serveur 2022 version Core (sans interface graphique) sur Virtualbox.
2. Installation des mises à jours avec l'outil SConfig 
![Capture d'écran 2025-04-27 213925](https://github.com/user-attachments/assets/b7f27261-2355-48ca-8e9f-3c3e251d4271)

## Installation Debian 12

### Installation de la commande sudo
1. aller sur l'administrateur avec la commande su - 
2. installer la commande sudo avec apt install sudo
3. Ajouter au groupe sudo avec la commande usermod -aG sudo debian (debian = nom d'utilisateur)
4. après cela, il faut redémarré debian 12

### Installation mises à jour
1. faire la commande sudo apt update pour installer les nouveaux mises à jour disponible
2. après ceci faire la commande sudo apt upgrade -y pour installer les mises à jour de tout les logiciels installés vers leur dernière version disponible et le -y c'est pour dire oui automatiquement 
 
