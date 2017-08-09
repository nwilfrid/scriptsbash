#!/bin/bash

## Auteur: Wilfrid NIOBET
## Date de dernière modification : 21/03/2017
## Editeur: Geany
## Version: 2.0
## Objet: Création d'un compte utilisateur
## Commentaire: Concernant les mot de passe du cluster,
##              ils sont définis par les administrateurs.

## Fonction de vérification de l'intégrité du mot de passe'
function verifpwd {
	## rendre invisible la saisi dans le terminal
	stty -echo

	while [ "$passw" == "" ] ; do
		read -p "Mot de passe: " passw1; echo
		read -p "Ressaisir le mot de passe: " passw2; echo

		if [ $passw1 = $passw2 ]; then
			echo "le mot de passe est correct"
			passw=$passw2
			motdepasse=$(mkpasswd --method=sha-512 $passw)
		else
			echo -e ".oO°°Oo.\n\t\tLes mots de passe ne sont pas identiques,\n \t\tregarder bien vos doigts et recommencer !\n.oO°°Oo"
		fi
	done
	}

## Fonction ajouter le compte utilisateur
function addCompte {
    useradd $uname -m \
	    --comment "Bureau $bureau, Tel $tel, Responsable $responsable, Find de service $finService" \
	    --password $motdepasse ;
	}

## Fonction pour afficher les informations saisie (teste des variables)
function testCompte {
	echo "Utilisateur: $uname" ;
	echo "pwd: $motdepasse" ;
	echo "Bureau: $bureau" ;
	echo "Tel: $tel" ;
	echo "Responsable: $responsable" ;
	echo "Fin de service: $finService" ;
	}

## Enregistrement des variables
passw=""
echo "Création d'un compte utilisateur:"
read -p "Username: " uname

verifpwd

## permettre à nouveau l'affichage dans le terminal
stty echo

## Enregistrement des commentaires sur le compte
read -p "Numéro de bureau: " bureau
read -p "Numéro de téléphone (00-00-00-00-00):" tel
read -p "Responsable: " responsable
read -p "Fin de service: (aaaa-mm-jj)" finService

echo "---"

addCompte

echo "Le compte $uname est maintenant créé !"

exit 0
