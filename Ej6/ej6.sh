#!/bin/bash

: '  
    Nombre del script: ej3.sh
    Trabajo Practico 2 - Ejercicio 3
    Grupo: 6
    Gómez Markowicz, Federico - 38858109
    Kuczerawy, Damián - 37807869
    Mediotte, Facundo - 39436162
    Siculin, Luciano - 39213320
    Tamashiro, Santiago - 39749147
'

get_help() {
	echo 'Comando ayuda:'
	echo '--------------'
	echo
	echo './ej6.sh [PATH] [-f]'
	echo
	echo 'PATH -> directorio raiz a analizar su contenido.'
	echo '-f -> (Opcional) incluye a los archivos con espacio en su nombre'	
	echo
	echo 'Ejemplos: ./ej6 /var -f'
	echo '          ./ej6 /var '
	echo '          ./ej6 -h'
	exit 
}

validar(){
if [ $# -ne 1 -a $# -ne 2 ] ; then
    echo 'La cantidad de parámetros enviados es incorrecta.'
	echo 'Utilizar -h/-?/-help para ver la ayuda.'
	exit -1
fi
if [ $1 = '-f' ] ;then
	echo '-f No se encuentra en la posicion correcta.'
	echo 'Utilizar -h/-?/-help para ver la ayuda.'
	exit -2
fi
if [ $1 = '-h' -o $1 = '-help' -o $1 = '-?' ] ;then
	get_help
	exit 1
fi
if [ ! -d $1 ] ;then
	echo "El path no existe. Ingrese un path valido."
	exit -3
fi
}

validar $1 $2 $3
dir=$1
aux=0
if [ $# -eq 2 ] ;then	#comprueba si se envio el parametro -f
	if [ $2 = '-f' ] ;then
		IFS='
		'
	fi
fi

for arch in $(find $dir -type d)
do	
	size=0
	cont=0
	for a in $(find $arch -maxdepth 1)
		do
		(( cont++ ))
		if [ -d $a -a $cont -ne 1 ] ;then
			aux=1
			
		else
			cont=`ls $arch | wc -l` #cantidad de archivos por carpeta
			size=`du -sb -h $arch | cut -f1` #tamaño de la carpeta
            
			
		fi	
	done
	if [ $aux -eq 0 -a $cont -ge 1 ] ;then #verificar que no hubo carpetas dentro de esa carpeta
		echo "$(dirname $a), $size, $cont arch" #y que las carpetas no estaban vacías
	fi
	aux=0
	cont=0
done | sort -t, -k 2 -rh | head -10 
