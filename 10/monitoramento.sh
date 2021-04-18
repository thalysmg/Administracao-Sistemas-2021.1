#/bin/bash

#awk pega a coluna desejada -> cut quebra a linha no delimitador passado 'G' e pega o indice passado como parametro e sed troca a vírgula pelo ponto

MEM_LOAD=$(free -h | grep Mem: | awk '{print $3}' | cut -d"G" -f 1 | sed 's/,/\./')

CPU_USER=$(vmstat -Sm | sed -n 3p | awk '{print $13}')
CPU_SYS=$(vmstat -Sm | sed -n 3p | awk '{print $14}')
CPU_LOAD=$(($CPU_USER+$CPU_SYS))

HOST=$(hostname)

curl -i -XPOST 'http://localhost:8086/write?db=monitor_rede_hardware' --data-binary 'mem_load,server='$HOST' value='$MEM_LOAD

curl -i -XPOST 'http://localhost:8086/write?db=monitor_rede_hardware' --data-binary 'cpu_load,server='$HOST' value='$CPU_LOAD

NUM_PROC=$(snmpwalk -v2c -c public 192.168.5.219 hrSystemProcesses | awk '{print $4}')

NUM_SERVICES=$(snmpwalk -v2c -c public 192.168.5.219 sysServices | awk '{print $4}')

curl -i -XPOST 'http://localhost:8086/write?db=monitor_rede_hardware' --data-binary 'num_proc,server='$HOST' value='$NUM_PROC

curl -i -XPOST 'http://localhost:8086/write?db=monitor_rede_hardware' --data-binary 'num_services,server='$NUM_SERVICES' value='$NUM_SERVICES
