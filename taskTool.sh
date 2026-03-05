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
