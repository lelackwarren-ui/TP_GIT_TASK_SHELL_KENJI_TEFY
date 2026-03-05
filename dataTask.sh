#!/bin/bash

initialiser_base()
{
	if [  -f tasks.txt ]
	then
		echo "le fichier tasks.txt existe deja bien"
	else
		 touch tasks.txt 
		 echo "le fichier a ete creer"
fi
}

afficher_toutes_taches()
{
	if [ -f tasks.txt ]
	then
		cat tasks.txt
	else
		echo "Base non initialisee"
fi
}

sauvegarder_base()
{
	if [ -f tasks.txt ]
	then
		cp tasks.txt tasks_backup.txt
		echo "Sauvegarde creee : tasks_backup.txt"

fi
}
restaurer_base()
{
	if [ -f tasks_backup.txt ]
	then
		cp tasks_backup.txt tasks.txt
		echo "Base restauree depuis la sauvegarde"
	else
		echo " Aucune sauvegarde disponible" 
}
