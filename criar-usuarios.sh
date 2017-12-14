#!/bin//bash

echo "Adicionando usuarios no servidor"

for USUARIO in $(cat usuarios.txt); do
   USER=$(cat /etc/passwd | grep ^$USUARIO | cut -d: -f1)
   test -z $USER
   if [ $? -eq 0 ]; then
      echo "O usuario $USUARIO nao esta cadastrado"
      echo "Para cadastrar, pressioner enter"
      read
      useradd $USUARIO
      echo "Usuario cadastrado com sucesso"
   else
      echo "Usuario $USUARIO ja cadastrado"
   fi
done
