#!/bin/bash

## Auteur: Wilfrid NIOBET
## Date de dernière modification : 21/03/2017
## Editeur: Geany
## Version: 1.0
## Objet: Création d'un compte utilisateur
## Commentaire: Concernant les mot de passe du cluster, 
##              ils sont définis par les administrateurs.

echo "Création d'un compte utilisateur:"
read -p "Username: " uname
stty -echo
passw=""
while [ "$passw" == "" ] ; do
	read -p "Mot de passe: " passw1; echo
	read -p "Ressaisir le mot de passe: " passw2; echo

	if [ $passw1 = $passw2 ]; then
		echo "le mot de passe est correct"
		passw="passw2"
	else
		echo "le mot de passe n'est pas identique, relancer le script pour créer un nouveau compte utilisateur."
	fi
done
stty echo

read -p "Numéro de bureau: " bureau
read -p "Numéro de téléphone (00-00-00-00-00):" tel
read -p "Responsable: " responsable
read -p "Fin de service: (aaaa-mm-jj)" finService

## Pour afficher les informations saisie (teste des variables)
#~ echo "Utilisateur: $uname"
#~ echo "pwd: ${!passw}"
#~ echo "Bureau: $bureau"
#~ echo "Tel: $tel"
#~ echo "Responsable: $responsable"
#~ echo "Fin de service: $finService"


## Décommenter cette partie ci-dessous pour rendre actif le script
#~ useradd $uname \
	#~ --comment "Bureau $bureau, Tel $tel, Responsable $responsable, Find de service $finService" \
	#~ --home-dir /home/$uname \
	#~ --expiredate $finService \ #seulement si le compte doit être inactif à une date définie
	#~ --create-home /home/$uname \
	#~ --password $passw \

echo "L'utilisateur est maintenant créé !!!"

exit 0
