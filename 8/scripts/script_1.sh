#!/bin/bash
echo ====================================================
echo -n "Relatório da Máquina: "
hostname
echo -n "Data/Hora: "
date
echo ====================================================
echo ""

echo -n "Máquina Ativa desde: "
uptime -s
echo ""

echo -n "Versão do Kernel: "
uname -v
echo ""

echo "CPUs: "
echo -n "Quantidade de CPUs/Core: "
cat /proc/cpuinfo | grep "core id" | sort | uniq | wc -l
echo -n "Modelo da CPU: "
cat /proc/cpuinfo | egrep "model name" | uniq | cut -d: -f2
echo ""

echo -n "Memória Total: "
free -m | grep Mem: | awk '{print $2}'
echo ""

echo "Partições: "
df

