#!/bin/bash

if [ $# -ne 1 ]; then
    echo 'La cantidad de parámetros enviados es incorrecta.'
	exit -1
fi  
cont=0
dir=$1
for i in ls $dir; do
        if [ -d $i ]; then
                echo $i
        fi
done
echo
echo
echo $cont
 
