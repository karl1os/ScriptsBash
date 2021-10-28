# =====================================
# title             : scriptcarving.sh
# description       : Script que de forma automatitzada recupera un 
#					  archiu .png de una imatge raw.
# author            : Carlos Hernandez Navarro
# date              : 25/10/2021
# version			: 1.2
# =====================================
#!/bin/bash
# Primer busca la linea on comenza el fitcher amb el numero magic i 
# imprimiex la sortida a un document temporal
if test -f resultcarving.txt; then
    rm resultcarving.txt
fi
clear
echo "\t \tWELCOME TO AUTODETECT .GZ SCRIPT \n"
echo "Que particion quieres analizar?"
read particion
echo "la particion que se va a analizar es /dev/$particion"
sleep 2s
clear
echo "THIS SCRIPT ONLY DETECTS POSSIBLE .GZ BUT THIS DOES NOT MEAN THAT IT IS IT" 
echo "\t \tEXECUTING, WAIT A MINUTE..."
echo "ANALYZING THE PARTITION /dev/$particion"
echo "=========================================================================="
xxd /dev/$particion | grep '..........1f8b 08' > tmplines.txt
#eliminar los espacios despues es mas optimo
sed -i 's/ //g' tmplines.txt
file="./tmplines.txt"
lines=$(cat $file)
narchive=1
for line in $lines
do
        echo $line > tmpresultcarving.txt
        sed -i 's/:/ /g' tmpresultcarving.txt
        principio=$(awk '{print $1}' ./tmpresultcarving.txt| tr [[:lower:]] [[:upper:]])
        principiod=$(echo "ibase=16;$principio" | bc)
        sed -i 's/ /:/g' tmpresultcarving.txt
        echo $(cat ./tmpresultcarving.txt) >> resultcarving.txt 
        echo "!!!Posible $narchiveº Archivo .gz\n!!!detectado en el offset=$principiod \n" >> resultcarving.txt
        narchive=$(($narchive+1))
done
clear
echo "DO IT WAIT..."
sleep 2s
clear
cat resultcarving.txt
echo "Se ha creado un archivo llamado resultcarnving.txt en $(pwd) con el resultado de el analisis"
rm tmpresultcarving.txt
rm tmplines.txt
