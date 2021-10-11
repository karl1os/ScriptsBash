# =====================================
# title             : esdir.sh
# description       : guió de shell que rebi un argument, si és un directori, mostra el missatge “El contingut del directori <nom_directori> és:” 
#					  i llisti el seu contingut. Si l’argument no és cap directori ha de donar un missatge informatiu. Amb control del nombre d’arguments.
# author            : Carlos Hernandez Navarro
# date              : 08/10/2021
# =====================================
#!/bin/bash
#comprovem el numero de arguments si no es igual a 1 imprimeix un mistage de error
if [ $# -ne 1 ]; then
	echo "Argument/s no valid/s"
	exit 1
fi
#comprovem si es un directori, en cas positiu per pantalla s'imprimeix el contingut del directori
if [ -d $1 ]; then
	echo "El contingut del directori $1 es:" 
	ls $1
#en cas contrari s'imprimeix un m istage de error
else
	echo "L'argument introduit no correspon amb cap directori"
fi
exit 0
