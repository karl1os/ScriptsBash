# =====================================
# title             : scriptej20.sh
# description       : Programar un shell script que cuente cuantos 
#					  directorios hay en la variable PATH.
# author            : Carlos Hernandez Navarro
# date              : 22/10/2021
# =====================================
#!/bin/bash
#extraigo la variable path a un archivo
echo $PATH > tmpej20.txt
path=$(sed 's/:/ /g' tmpej20.txt)
rm tmpej20.txt
for x in $path
do
	echo "$x ---- $(ls -l $x | wc -l)"
done


