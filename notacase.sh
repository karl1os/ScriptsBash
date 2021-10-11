# =====================================
# title             : notacase.sh
# description       : demana el valor d’una nota (un nombre enter) ens diu si la nota és una D (0, 1, 2),
#					  una C- (3, 4), una C+ (5, 6), una B (7, 8) o una A (9,10) en aquest cas amb una 
#					  estructura case.
# author            : Carlos Hernandez Navarro
# date              : 08/10/2021
# =====================================
#!/bin/bash
echo "Indica la nota en format enter entre 0 i 10: "
read NOTA
case "$NOTA" in
	0)
		echo "Tens una D."
	;;
	1)
		echo "Tens una D."
	;;
	2)
		echo "Tens una D."
	;;
	3)
		echo "Tens una C-."
	;;
	4)
		echo "Tens una C-."
	;;
	5)
		echo "Tens una C+."
	;;
	6)
		echo "Tens una C+."
	;;
	7)
		echo "Tens una B."
	;;
	8)
		echo "Tens una B."
	;;
	9)
		echo "Tens una A."
	;;
	10)
		echo "Tens una A."
	;;
	*)
		echo "He dit entre 0 i 10, llegeix be."
esac
exit 0
