#!/bin/bash
t=0
tf=25
while [ $t -ne 25 ]; do
	((tf-=1))
	echo "Quedan $tf minuts per veure't :$"
	((t+=1))
	sleep 1m
done
exit

