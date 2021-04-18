#!/bin/bash

if [ -f $1 ]; then
	echo "Arquivo encontrado"
else
	echo "Arquivo não encontrado"
fi

if [ -d $1 ]; then
	echo "Diretório existe"
else
	echo "Diretório não existe ou não encontrado"
fi
