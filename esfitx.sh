# =====================================
# title             : esfitx.sh
# description       : guió de shell que indiqui si un nom donat com a paràmetre és un fitxer regular.
# author            : Carlos Hernandez Navarro
# date              : 08/10/2021
# =====================================
#!/bin/bash
#comprova si l'argument $1 es un fitxer imprimint per pantalla el resultat positiu de la operacio.
if [ -f $1 ]; then
	echo "$1 és un fitxer."
else
	echo "$1 no és un fitxer."
fi
exit 0
