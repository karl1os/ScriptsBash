# =====================================
# title             : calcdu2.sh
# description       : calcula l'espai ocupat al directori rebut per 
#					  consola
# author            : Carlos Hernandez Navarro
# date              : 11/10/2021
# =====================================
#!/bin/bash
echo "digues quin directori vols calcular l'espai ocupat: "
read dir
#Calcula l'espai que ocupa cada carpeta i mostra el total ocupat
if [ -d $dir ]; then
	du -sh $dir
	exit 0
else
	echo "aquest directori no existeix"
	exit 1
fi

