#!/bin/bash
echo ====================================================
read -p "Relatório do Usuário: " usuario
echo ""

echo -n "UID: "
id -u $usuario

echo -n "Nome ou Descrição: "
cat /etc/passwd | grep $usuario | cut -d: -f5
echo ""

echo -n "Total usado no /home/"$usuario": "
du --max-depth=0 -h /home/$usuario | awk '{print $1}'
echo ""

echo "Ultimo Login:"
echo "Nome de Usuário      Porta       De      Último"
last -FR -n1 $usuario | grep $usuario
echo ====================================================