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
