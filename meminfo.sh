# =====================================
# title             : meminfo.sh
# description       : escriu un script que mostri la mateixa salida que
#					  el comandament "cat /proc/meminfo" pero 
#					  transformant els kB a GB.
# author            : Carlos Hernandez Navarro
# date              : 28/09/2021
# =====================================
#!/bin/bash
mem=/proc/meminfo
#awk procesa dades basades en text, els parametres que el segueixen 
#indican que si el camp 3 es = kB llavors el camp 2 se el mateix camp 2
#dividit per 1024, el camp 3 pasa a ser GB, i executa aquesta operacio
#1 vegada sobre mem (cat/meminfo), crea una taula amb un numero 
#determinat de columnes.
awk '$3=="kB"{$2=$2/1024^2;$3="GB";} 1' $mem | column -t

