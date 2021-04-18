#!/bin/bash

echo Informe um nome
read NOME
case $NOME in
	Jose*)
	echo "Boa noite Jose."
	;;
	Joao*)
	echo "Boa noite Joao."
	;;
	*)
	echo "Nao te conheco."
	exit 1
	;;
esac
