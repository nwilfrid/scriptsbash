#!/bin/bash

# touver les fichiers images dans le répertoire courant et les renomer par rapport à la date et l'heure de création de l'image :
find . -maxdepth 1 -type f -exec exiv2 -r %Y-%m-%d_%H%M%S:basename: rename '{}' \;

# création des répertoires par date
#datecommune=$(ls -F | grep -v '/' | awk -F '_' '{print $1}' | uniq) # supprimant les répertoires de la liste
#datecommune=$(ls *.JPG *.CR2 | awk -F '_' '{print $1}' | uniq) # limitant la liste au fichier JPG et CR2
#basename -a $(find . -maxdepth 1 -iname "*.jpg" -o -iname "*.cr2" | awk -F '_' '{print $1}' | uniq)
# ou
#find . -maxdepth 1 -iname "*.jpg" -o -iname "*.cr2" -exec basename '{}' \; | awk -F '_' '{print $1}' | uniq
#en variable

datecommune=$(find . -maxdepth 1 -iname "*.jpg" -o -iname "*.cr2" -exec basename '{}' \; | awk -F '_' '{print $1}' | sort -u)
for i in $datecommune;do mkdir $i;done

# déplace les fichiers dans les bons répertoires
for i in $datecommune;do mv $i'_'* $i;done

######## prise de note

# renomer les fichiers par les dates
#exiv2 rename [fichier]
#find . -maxdepth 1 -type f -exec exiv2 rename '{}' \;

# retrouver les dates communes
#ls -F | grep -v '/' | awk -F '_' '{print $1}' | uniq

# création des répertoires à partir des dates communes
#datecommune=$(ls -F | grep -v '/' | awk -F '_' '{print $1}' | uniq)
#for i in $datecommune;do mkdir $i;done

# ls = liste les fichiers et dossier dans le répertoire courant. L'option -F ajoute un caractère à chaque entrée
# grep -v '/' = filtre et exclus les répertoires (se terminant par /)
# awk -F '_' '{print $1}' = filtre la date dans le nom des fichiers, la date se trouve dans la première colonne (chaque colonne est séparé par '_'
# uniq = exclus les doublons


# Déplacer les fichiers dans leur répertoire respectif par date
# cette suite de commande permet de faire ressortir des familles de date des fichiers images renomés.
#fichiers=$(ls -F | grep -v "/" | cut -c1-9 | uniq)

# Compte le nombre de fichier ayant la même date
#for i in $fichiers;do ls $i* | wc -l;done

# ou bien
#fichiers=$(ls -F | grep -v "/" | cut -c1-8 | uniq)
#for i in $fichiers;do ls $i'_'* | wc -l;done

#for i in $datecommune; do cp -v $i'_'* $i; done

#for i in $fichiers
#do if $i == $datecommune
#   then
#       echo "il y a "$(ls $i'_'* | wc -l)"fichiers du $i"
#   fi
#done
#exit 0
