#!/bin/bash
# Del 1 al infinito, pero solo hasta el 5   OK
num=5
i=0
while [ $i -le "$num" ];do
echo "El numero es $i"
i=$((i+1))
done

# Comandos
# sudo gpasswd -d  usuario    name_grupo  >>> elimina un usuario de un grupo_A por ejemplo

# cat /etc/passwd |  grep grupo_A    >>> busca dentro del fichero passwd y se enfoca en el grupo_A

#

