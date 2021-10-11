# =====================================
# title             : endevina.sh
# description       : Assigna un número aleatori entre 1 i 6 a una 
#					  variable N, a continuació ens demani que 
# 					  l’encertem. 
#					  Finalitza quan encertem el número i ens diu 
#					  quants intents hem necessitat per endevinar-lo.
# author            : Carlos Hernandez Navarro
# date              : 11/10/2021
# =====================================
#!/bin/bash
intents=1
#Generador numero aleatori
RANGO=$((0-7+1))
RANDOM=$$
NUMRANDOM=$(($(($RANDOM%$RANGO))+1))
#primera interfaç on es llegeix el numero introduit per l'usuari
echo "has de descobir el numero secret entre 1 i 6"
echo "quin numero dirias que es?"
echo "escriu la teva resposta:"
read NUMUSER
#comprovem, si no ha encertat retornem els intens i demanem un altre 
#numero sumant 1 als intents.
while test $NUMUSER -ne $NUMRANDOM; do
	let "intents++"
	echo "No has encertat el numero"
	echo "portes $intents"
	echo "digues un altre numero:"
	read NUMUSER
done
#finalitzem imprimint un mistage de congratulacio i esperem per
#finalitzar el script.
clear
echo "Felicitats has encertat en nomes $intents intents"
echo " el numero aleatori era $NUMRANDOM"
echo "tu has dit $NUMUSER"
echo "pulsa intro per sortir"
read FI
exit 0
