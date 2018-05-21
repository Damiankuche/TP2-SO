#!/bin/bash

if [ $# -ne 1 ]; then
    echo 'La cantidad de parámetros enviados es incorrecta.'
	exit -1
fi
cont=0
declare -A cantidades
dir=$1
cantidades=`ls -Rsh $dir`
for a in `ls -RA $dir `;do
	if [ ! -d $a ]; then
		((cont++))
		echo $a
	else
		basename $a
		echo ""
	fi
done
echo
echo $cont



