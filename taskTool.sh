#!/bin/bash
ajouter_tache()
{
	echo "Entrez une description de vos taches a faire :"
	read descripition

	if [ ! -f tasks.txt ]; then
		id = 1
	else
		lignes=$(wc -l < tasks.txt)
		id=$((lignes + 1))
	fi

	echo " $id  | $description | 0" >> tasks.txt
}
 
suprimer_tache()
{
	echo "Entrer l'Id de la tache aqq suprimer :"
	read id

	while IFS= read -r ligne
	do
		ligne_id = $(echo $ligne | cut -d "|" -f1)

		if [" $ligne_id " != " $id "]; then
			echo " $ligne " >> temp.txt
	done < tasks.txt
	mv temp.txt tasks.txt

	echo "Tache suprimee"
}

marquer_terminer()
{
	echo "Entrer l'Id de la tache terminer :"
	read id

	while IFS = read -r ligne
	do
		ligne_id = $(echo  $ligne | cut -d "|" -f1)

		if [ "$ligne_id" = "$id" ]; then
	`		description = $(echo $ligne | cut -d "|" -f2)
			echo "$id | $description | 1" >> temp.txt
		else
			echo "$ligne" >> temp.txt
		fi

	done < tasks.txt


	mv temp.txt tasks.txt
	echo "tache marquee finie"
}

afficher_tache()
{
	if [ ! -f tasks.txt ]; then
		echo  "Aucune tache disponible "
		return
	fi

	echo "ID | DESCRIPTION | STATUT"

	while IFS = "|" read id description statut 
	do 

		if ["$statut" -eq 1]; then
			echo  "$id  | $description | terminee "
		else
			echo  "$id  | $decription  | EN cours "
		fi

	done < tasks.txt

}
