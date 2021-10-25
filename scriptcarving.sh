# =====================================
# title             : scriptcarving.sh
# description       : Script que de forma automatitzada recupera un 
#					  archiu .png de una imatge raw.
# author            : Carlos Hernandez Navarro
# date              : 25/10/2021
# version			: 1.0
# =====================================
#!/bin/bash
# Primer busca la linea on comenza el fitcher amb el numero magic i 
# imprimiex la sortida a un document temporal
xxd imagen | sed 's/ //g' | grep 89504e47 > tmpfirstline.txt
# Subtitueix els dos punts del separador entre el numero de linea i 
# la linea d'informacion
sed -i 's/:/ /g' tmpfirstline.txt
# Es guarda el numero de linea en mayusculas que correspon a la 
# primera paraula 
principio=$(awk '{print $1}' tmpfirstline.txt | tr [[:lower:]] [[:upper:]])
# pasa a decimal el numero de linea
principiod=$(echo "ibase=16;$principio" | bc)
# repeteix el proces amb el final de l'archiu
xxd imagen | sed 's/ //g' | grep 49454e44ae426082 > tmplastline.txt
sed -i 's/:/ /g' tmplastline.txt
final=$(awk '{print $1}' tmplastline.txt | tr [[:lower:]] [[:upper:]])
# Suma els bites de inforamcio a la linea
finald=$(echo "ibase=16;$final+B" | bc)
# Restem per saber el tamany de l'archiu
size=$(echo "$(($finald - $principiod))")
#volcem l'a informacio a un archiu amb la seva extensio.
dd  if=imagen  of=result.png  skip=$principiod  bs=1  count=$size
rm tmpfirstline.txt tmplastline.txt
