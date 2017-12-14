#!/bin/bash

clear

echo -e "
   1 - Adicionar usuario
   2 - Deletar usuario
   3 - Verificar usuario"

echo -n "Escolha uma das opcoes:"
read OTP

case $OTP in
1)
   clear
   echo -n "Digite o nome do usuario:"
   read USUARIO
   echo -n "Digite a senha:"
   read SENHA

   echo "Adicionando um novo usuario"
   adduser $USUARIO
   echo $SENHA | passwd $USUARIO --stdin
   echo $USUARIO >> usuarios.txt
   if [ $? -eq 0 ]; then
      echo "Usuario foi adicionado com sucesso"
   else
      echo "Nao foi possivel adicionar o usuario"
   fi
;;

2)
   clear
   echo "Digite o nome do usuario para deletar:"
   read USUARIO

   echo "Deletando o usuario"
   userdel $USUARIO

   if [ $? -eq 0 ]; then
      echo "O usuario foi deletado com sucesso"
   else
      echo "Nao foi possivel deletar o usuario"
   fi
;;

3)
   clear
  /root/scripts-shell/criar-usuarios.sh
;;

*)
   echo "Escolha uma opcao valida"

esac 
