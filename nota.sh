# =====================================
# title             : nota.sh
# description       : demana el valor d’una nota (un nombre enter) ens diu si la nota és una D (0, 1, 2),
#					  una C- (3, 4), una C+ (5, 6), una B (7, 8) o una A (9,10).
# author            : Carlos Hernandez Navarro
# date              : 08/10/2021
# =====================================
#!/bin/bash
echo "Indica la nota en format enter entre 0 i 10: "
read NOTA
if [ $NOTA -lt 0 ] || [ $NOTA -gt 10 ]; then
	echo "He dit entre 0 i 10, llegeix be"
	elif [ $NOTA -lt 3 ]; then
		echo "Tens una D."
	elif [ $NOTA -lt 5 ]; then
		echo "Tens una C-."
	elif [ $NOTA -lt 7 ]; then
		echo "Tens una C+."
	elif [ $NOTA -lt 9 ]; then
		echo "Tens una B."
else
	echo "Tens una A."
fi
exit 0
