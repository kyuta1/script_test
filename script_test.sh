#!/bin/bash

##################################################
#
# Application de test Machine et web
#
#	Créer par François REINHORN
#
# V1.8
#
# Licence GNU
#
##################################################

# Variable Couleur

noir='\e[0;30m' gris='\e[1;30m' rougefonce='\e[0;31m' rose='\e[1;31m' vertfonce='\e[0;32m' vertclair='\e[1;32m' orange='\e[0;33m' jaune='\e[1;33m' bleufonce='\e[0;34m' bleuclair='\e[1;34m' violetfonce='\e[0;35m' violetclair='\e[1;35m' cyanfonce='\e[0;36m' cyanclair='\e[1;36m' grisclair='\e[0;37m' blanc='\e[1;37m' neutre='\e[0;m'

# Fonction

function banner
{
echo -e "${bleufonce}Application de test Machine et web${neutre}"

# Affichage version et Licence

echo -e "${bleufonce}V1.8${neutre}"
echo -e "${bleufonce}Licence GNU${neutre}"
echo -e "${bleufonce}Créer par François REINHORN${neutre}"

#Saut de ligne
printf "%b\n"

}

# Affichage du menu

function menu
{
  clear
  echo -e "${vertclair}Menu :${neutre}"
  #Saut de ligne
  printf "%b\n"
	echo -e "Type de test?\n \n	1. Test machine\n	2. Test Web\n	3. Test Reverse\n	4. Note de version\n        5. Quitter\n"
	echo -n "Réponse : " && read choice
}

# Fonction test machine

function test_machine
{
  #Saisie des informations
  printf "%b\n"
  echo -e "${bleuclair}Entrez le nom du service :${neutre}"
  read -r service

  # Netoyage de l'écran

  clear

  # Récupère information de temps

  date

  # Récupère les informations de la machine passer en paramètre (IP ou nom de la machine)

  # Affiche le nom de la machine

  echo -e "Test de / Test of $service"
  printf "%b\n"

  #Ping la machine

  echo -e "Test ping pour / ping test for $service :"
  printf "%b\n"
  echo -e "ping $service"
  printf "%b\n"
  ping -c 5 $service

  #Test tous les ports ouvert sur cette machine

  echo -e "nmap $service -Pn"
  printf "%b\n"
  echo -e "Ports ouvert sur / Open gate on $service"
  printf "%b\n"
  nmap $service -Pn

  #Test Mtr sur cette machine

  echo -e "mtr -r $service"
  printf "%b\n"
  echo -e "Traceroute $service:"
  printf "%b\n"
  mtr -r $service
  pause
  echo -e "Que souhaitez-vous faire?"
  echo -e "1) Retour au menu principal 2) Refaire le test"
  echo -n "Réponse : " && read choice
  while true ; do
  	case $choice in
  #Affichage du menu
  		0)
  			menu
  			;;
  #Test Machine
  		1)
  			menu
  			;;
  #Test nom de domaine
  		2)
  			test_machine
  			;;
  		*)
  			echo 'Mauvais choix ! Essayez encore !'
  			pause
  			choice=0
  			clear
  			;;
  	esac

  done
}
#Test web

function test_web
{
  #Saisie des informations

  printf "%b\n"
  echo -e "${bleuclair}Entrez le nom du service :${neutre}"
  read -r service

   # Netoyage de l'écran

  clear

     # Récupère information de temps

  date

     # Récupère les informations de la machine passer en paramètre (IP ou nom de la machine)

     # Affiche le nom de la machine

  echo -e "Test de / Test of $service"
  printf "%b\n"

      #Curl

  echo -e "Curl de / Curl information for $service :"

     #Whois
  echo -e "curl -ILvk $service"
  printf "%b\n"
  curl -ILvk $service


  echo -e "Whois de / Whois information for $service :"
  printf "%b\n"
  echo -e "whois $service"
  printf "%b\n"
  whois $service

     #Dig NS

  echo -e "DIG NS de / DIG NS for $service :"
  printf "%b\n"
  echo -e "dig ns $service"
  printf "%b\n"
  dig ns $service

  #Dig A

  echo -e "DIG A de / DIG A for $service :"
  printf "%b\n"
  echo -e "dig A $service"
  printf "%b\n"
  dig a $service

     #Dig MX

  echo -e "DIG MX de / DIG MX for $service :"
  printf "%b\n"
  echo -e "dig mx $service"
  printf "%b\n"
  dig mx $service

  #Dig SOA

  echo -e "DIG SOA de / DIG SOA for $service :"
  printf "%b\n"
  echo -e "dig SOA $service"
  printf "%b\n"
  dig SOA $service

  #Dig TXT

  echo -e "DIG TXT de / DIG TXT for $service :"
  printf "%b\n"
  echo -e "dig TXT $service"
  printf "%b\n"
  dig TXT $service
  pause
  echo -e "Que souhaitez-vous faire?"
  echo -e "1) Retour au menu principal 2) Refaire le test"
  echo -n "Réponse : " && read choice
  while true ; do
  	case $choice in
  #Affichage du menu
  		0)
  			menu
  			;;
  #Test Machine
  		1)
  			menu
  			;;
  #Test nom de domaine
  		2)
  			test_web
  			;;
  		*)
  			echo 'Mauvais choix ! Essayez encore !'
  			pause
  			choice=0
  			clear
  			;;
  	esac

  done
}

# Check reverse DNS
function test_reverse
 {
   printf "%b\n"
   echo -e "${bleuclair}Entrez le nom du service :${neutre}"
   read -r service
   echo -e "Reverse de l'IP / Reverse of IP addres $service :"
   printf "%b\n"

       #Dix -x

   echo -e "dig -x $service"
   printf "%b\n"
   dig -x $service
   pause
   echo -e "Que souhaitez-vous faire?"
   echo -e "1) Retour au menu principal 2) Refaire le test"
   echo -n "Réponse : " && read choice
   while true ; do
   	case $choice in
   #Affichage du menu
   		0)
   			menu
   			;;
   #Test Machine
   		1)
   			menu
   			;;
   #Test nom de domaine
   		2)
   			test_reverse
   			;;
   		*)
   			echo 'Mauvais choix ! Essayez encore !'
   			pause
   			choice=0
   			clear
   			;;
   	esac

   done
 }

function note_version
{
clear
banner
cat script_test_version
pause
menu
}

function pause
# This function is the bash like "system pause"'s C function
{
	echo -n 'Appuyez sur une touche pour continuer…' && read a
}

function yes_no
#This function is for the yes-no question
{
	local reponse
	while true ; do
		echo -n 'Voulez-vous continuer ? (y/N) : '
		read reponse
		if [ $reponse = "y" ] || [ $reponse = "Y" ]; then
			echo 'Okey ! '
			pause
			return 0
		fi
		if [ $reponse = "n" ] || [ $reponse = "N" ]; then
			echo 'Retour au menu précédent'
			pause
			clear
			return 1
		fi
	done
}

# Fonction principale

clear
banner
menu

while true ; do
	case $choice in
#Affichage du menu
		0)
			menu
			;;
#Test Machine
		1)
			test_machine
			;;
#Test nom de domaine
		2)
			test_web
			;;
#Test de Reverse
		3)
			test_reverse
			;;
#Note de version
    4)
      note_version
      ;;
#Condition de sortie
		5)
			echo 'Sortie du programme !'
			break;;
		*)
			echo 'Mauvais choix ! Essayez encore !'
			pause
			choice=0
			clear
			;;
	esac

done
