#!/bin/bash
# Del 1 al infinito, pero solo hasta el 5   OK
num=5
i=0
while [ $i -le "$num" ];do
echo "El numero es $i"
i=$((i+1))
done
# sudo gpasswd -d  usuario    name_grupo
