#!/bin/bash

if [ $# -ne 1 ]; then
    echo 'La cantidad de parámetros enviados es incorrecta.'
	exit -1
fi
cont=0
declare -A cantidades
dir=$1
for a in $(ls -UAR $dir);do
	 	
		((cont++))
		  echo $a
	 
done
echo
echo $cont


